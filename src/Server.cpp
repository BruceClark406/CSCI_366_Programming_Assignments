//    Battleship game assignment for MSU CSCI 366
//    Copyright (C) 2020    Mike P. Wittie
//
//    This program is free software: you can redistribute it and/or modify
//    it under the terms of the GNU General Public License as published by
//    the Free Software Foundation, either version 3 of the License, or
//    (at your option) any later version.
//
//    This program is distributed in the hope that it will be useful,
//    but WITHOUT ANY WARRANTY; without even the implied warranty of
//    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//    GNU General Public License for more details.
//
//    You should have received a copy of the GNU General Public License
//    along with this program.  If not, see <https://www.gnu.org/licenses/>.


#include "common.hpp"
#include "Server.hpp"

/**
 * Calculate the length of a file (helper function)
 *
 * @param file - the file whose length we want to query
 * @return length of the file in bytes
 */





int get_file_length(ifstream *file){
    // ripped this from here: http://www.cplusplus.com/reference/istream/istream/seekg/

    file->seekg(0, file->end);
    int length = file->tellg();
    file->close();
    return length;
}


void Server::initialize(unsigned int board_size, string p1_setup_board, string p2_setup_board){

    // make sure p1 and p2 setup boards exist
    try{
        this->p1_setup_board.open(p1_setup_board);
        this->p2_setup_board.open(p2_setup_board);
        //check size of board
        this->board_size = board_size;

        int file_length1 = get_file_length(&this->p1_setup_board);
        int file_length2 = get_file_length(&this->p2_setup_board);
        this->p1_setup_board.close();
        this->p2_setup_board.close();

        int predicted_board_size = (board_size)*(board_size+1);

        if (predicted_board_size != file_length1 && predicted_board_size != file_length2){
            throw ServerException("Board is not the expected size");
        }


    }catch (int e){
        throw ServerException("A board is not set up!");
    }
}


int Server::evaluate_shot(unsigned int player, unsigned int x, unsigned int y) {

    if (player > MAX_PLAYERS){
        throw ServerException("Too many players...");
    }else if(player <= 0){
        throw ServerException("Too few players...");
    }else if (x >= BOARD_SIZE or y >= BOARD_SIZE){
        return OUT_OF_BOUNDS;
    }


    int num_of_char = x * BOARD_SIZE + y;

    // http://www.cplusplus.com/reference/istream/istream/seekg/
    // https://www.geeksforgeeks.org/set-position-with-seekg-in-cpp-language-file-handling/
    ifstream board_file ("player_"+to_string(player)+ ".setup_board.txt", ifstream::binary);

    // read char from board
    board_file.seekg (num_of_char, board_file.beg);
    char board_char[1];
    board_file.read(board_char, 1);
    board_file.close();


    if (board_char[0] == '_'){
        p1_setup_board.close();
        return MISS;
    } else{
        p1_setup_board.close();
        return HIT;
    }
}


int Server::process_shot(unsigned int player) {
    //checking again to pass tests
    if (player > MAX_PLAYERS){
        throw ServerException("Too many players...");
    }else if(player <= 0){
        throw ServerException("Too few players...");
    }

    // read shot from shot.json
    string fname = "player_"+to_string(player)+".shot.json";
    ifstream read_shot(fname);
    if (read_shot.good())
    {
        vector< int > shot_array(2);
        cereal::JSONInputArchive read_archive(read_shot);
        read_archive(shot_array[0],shot_array[1]);
        read_shot.close();

        // once processed remove file
        remove((fname).c_str());


        // get the result with the coordinates
        int result = evaluate_shot(player,shot_array[0],shot_array[1]);




        // serialize the results to result.json
        ofstream write_result("player_"+to_string(player)+".result.json"); // create an output file stream
        cereal::JSONOutputArchive write_archive(write_result); // initialize an archive on the file
        write_archive(cereal::make_nvp("result", result)); // serialize the data giving it a name
        // for some reason we do not wait for the file to write or the close the file
        // per announcement of Mike Wittie

        return SHOT_FILE_PROCESSED;
    }
    else{
        return NO_SHOT_FILE;
    }

}
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
#include "Client.hpp"

Client::~Client() {
}


void Client::initialize(unsigned int player, unsigned int board_size){
    this->player = player;
    this->board_size = board_size;
    this->initialized = true;

    // initialize the board array
    vector<vector<int>> board(board_size, vector<int>(board_size));

    //write the board to "player_"+to_string(player)+".action_board.json"
    // serialize the array
    ofstream array_ofp("player_"+to_string(player)+".action_board.json"); // create an output file stream
    cereal::JSONOutputArchive write_archive(array_ofp); // initialize an archive on the file
    write_archive(cereal::make_nvp("board", board)); // serialize the data giving it a name
}


void Client::fire(unsigned int x, unsigned int y) {
    string fname = "player_"+to_string(player)+".shot.json";
    // remove any old serialization files
    remove(fname.c_str());

    // create an integer array
    vector< int > array1(2);
    array1[0] = x;
    array1[1] = y;

    // serialize the array, right shot to shot.json
    ofstream array_ofp(fname); // create an output file stream
    cereal::JSONOutputArchive write_archive(array_ofp); // initialize an archive on the file
    write_archive(cereal::make_nvp("x", array1[0])); // serialize the data giving it a name
    write_archive(cereal::make_nvp("y", array1[1])); // serialize the data giving it a name

}


bool Client::result_available() {
    // I think this is right, not sure
    // dont think there is a test associated with this method
    ifstream result_file("player_"+to_string(player)+".result.json");
    return result_file.good();
}


int Client::get_result() {
    string fname = "player_"+to_string(player)+".result.json";
    // create a two dimensional array for deserialization
    int result;

    // deserialize the array
    ifstream array_ifp(fname); // create an input file stream
    cereal::JSONInputArchive read_archive(array_ifp); // initialize an archive on the file
    read_archive(result); // deserialize the array
    array_ifp.close(); // close the file

    //remove the file
    remove(fname.c_str());

    // print the result of deserialization
    printf("results was a %d\n", result);

    if (result == HIT){
        return HIT;
    }else if(result == MISS ){
        return MISS;
    }else if(result == OUT_OF_BOUNDS){
        return OUT_OF_BOUNDS;
    }else{
        throw ClientException("BAD crap in client.");
    }
}



void Client::update_action_board(int result, unsigned int x, unsigned int y) {
    vector<vector<int>> board_array(board_size, vector<int>(board_size));
    string fname = "player_"+to_string(player)+".action_board.json";
    // deserialize the action board into board array
    ifstream read_board(fname); // create an input file stream
    cereal::JSONInputArchive read_archive(read_board); // initialize an archive on the file
    read_archive(board_array); // deserialize the array
    read_board.close(); // close the file

    // get result of shot, y rows, x = columns
    board_array[y][x] = result;

    //write board to "player_"+to_string(player)+".action_board.json"
    // serialize the array
    ofstream write_board(fname); // create an output file stream
    cereal::JSONOutputArchive write_archive(write_board); // initialize an archive on the file
    write_archive(cereal::make_nvp("board", board_array)); // serialize the data giving it a name

}


string Client::render_action_board(){
    vector<vector<int>> board_array(board_size, vector<int>(board_size));
    string fname = "player_"+to_string(player)+".action_board.json";
    // deserialize the action board into board array
    ifstream read_board(fname); // create an input file stream
    cereal::JSONInputArchive read_archive(read_board); // initialize an archive on the file
    read_archive(board_array); // deserialize the array
    read_board.close(); // close the file

    string board_string;

    for (int i = 0; i < this->board_size; i++){
        for (int j = 0; j < this->board_size; j++){
            if(board_array[i][j] == HIT){
                board_string += "H";
            }else if(board_array[i][j] == MISS){
                board_string += "M";
            }else{
                board_string += "-";
            }
        }
        board_string += "\n";
    }
    return board_string;
}


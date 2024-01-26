#include"Texter.h"
#include "Texter.h"
#include <iostream>
#include <utility>
#include <cstring>

using namespace std;

Texter::Texter(const char *s1, const char *s2) {
	if (s1 == nullptr) {
		_text1 = nullptr;
	} else {
		_text1 = new char(strlen(s1) + 1);
		for (unsigned i = 0; i < strlen(s1) + 1; ++i) {
			_text1[i] = s1[i];
		}
	}
	if (s2 == nullptr) {
		_text2 = nullptr;
	} else {
		_text2 = new char(strlen(s2) + 1);
		for (unsigned i = 0; i < strlen(s2) + 1; ++i) {
			_text2[i] = s2[i];
		}
	}

}

Texter::Texter(const Texter &other) {
	if (other._text1 == nullptr) {
		_text1 = nullptr;
	} else {
		_text1 = new char(strlen(other._text1));
		for (unsigned i = 0; i < strlen(_text1); ++i) {
			_text1[i] = other._text1[i];
		}
	}
	if (other._text2 == nullptr) {
		_text2 = nullptr;
	} else {
		_text2 = new char(strlen(other._text2));
		for (unsigned i = 0; i < strlen(_text2); ++i) {
			_text2[i] = other._text2[i];
		}
	}
}

Texter::~Texter() {
	delete[] _text1;
	delete[] _text2;
}

Texter& Texter::operator=(const Texter &other) {
	delete[]_text1;
	delete[]_text2;
	_text1 = new char(strlen(other._text1));
	_text2 = new char(strlen(other._text2));
	strcpy(_text1 , other._text1);
	strcpy(_text2, other._text2);
	return *this;

}

unsigned Texter::entire_length() const {
	int a = this->length_smallest() + this->length_largest();
	return a;
}

unsigned Texter::length_smallest() const {
	int a = strlen(_text1);
	int b = strlen(_text2);
	if (a < b) {
		return a;
	} else
		return b;
}

unsigned Texter::length_largest() const {
	int a = strlen(_text1);
	int b = strlen(_text2);
	if (a > b) {
		return a;
	} else
		return b;
}

void Texter::flip() {
}

void Texter::merge() {
}

void Texter::swap_both(Texter &other) {
	swap(other._text1, _text1);
	swap(other._text2, _text2);
}

void Texter::swap_largest_length(Texter &other) {
}

bool Texter::operator==(const Texter &other) {
	return false;
}


#!/bin/bash
case $1 in
	"dv") setxkbmap -layout pl -variant dvorak;;
	"pl") setxkbmap -layout pl ;;
esac

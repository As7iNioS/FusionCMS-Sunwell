<?php

interface IEmulator
{
    public function sendCommand($command);
    public function hasConsole();
    public function hasStats();
    public function sendItems($character, $subject, $body, $items);
    public function sendMail($character, $subject, $body);
    public function ticketResponse($ticket, $body);
    public function ticketClose($ticket);
    public function getTable($name);
    public function getColumn($table, $name);
    public function getQuery($name);
    public function getAllColumns($table);
    public function encrypt($username, $password);
    public function __construct($config);
}
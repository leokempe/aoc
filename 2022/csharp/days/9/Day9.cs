using System;
using System.IO;

class Day9
{
    public static void Part1()
    {
        var input = Aoc2022.ReadInput(9);

        var _headX = 0;
        var _headY = 0;
        var _tailX = 0;
        var _tailY = 0;

        List<Tuple<int, int>> _tailCoords = new() { Tuple.Create(0, 0) }; 

        foreach (var line in input)
        {
            var splitLine = line.Split(' ');
            var direction = splitLine[0].ToCharArray()[0];
            var steps = int.Parse(splitLine[1]);

            for (var i = 0; i < steps; i++)
            {
                switch (direction)
                {
                    case 'R':
                        _headX += 1;
                        break;

                    case 'L':
                        _headX -= 1;
                        break;

                    case 'U':
                        _headY += 1;
                        break;

                    case 'D':
                        _headY -= 1;
                        break;
                }


                if (Math.Abs(_headX - _tailX) > 1 || Math.Abs(_headY - _tailY) > 1)
                {
                    if (_headX > _tailX)
                        _tailX += 1;
                    else if (_headX < _tailX)
                        _tailX -= 1;

                    if (_headY > _tailY)
                        _tailY += 1;
                    else if (_headY < _tailY)
                        _tailY -= 1;

                    _tailCoords.Add(Tuple.Create(_tailX, _tailY));
                }
            }
        }

        Console.WriteLine($"{_tailCoords.Distinct().Count()}");
    }

    public static void Part2()
    {
        var input = Aoc2022.ReadInput(9);

        var _currXCoords = new int[10];
        var _currYCoords = new int[10];

        List<Tuple<int, int>> _tailCoords = new() { Tuple.Create(0, 0) };

        foreach (var line in input)
        {
            var splitLine = line.Split(' ');
            var direction = splitLine[0].ToCharArray()[0];
            var steps = int.Parse(splitLine[1]);

            for (var i = 0; i < steps; i++)
            {
                switch (direction)
                {
                    case 'R':
                        _currXCoords[0] += 1;
                        break;

                    case 'L':
                        _currXCoords[0] -= 1;
                        break;

                    case 'U':
                        _currYCoords[0] += 1;
                        break;

                    case 'D':
                        _currYCoords[0] -= 1;
                        break;
                }

                for (var j = 1; j < 10; j++)
                {
                    if (Math.Abs(_currXCoords[j - 1] - _currXCoords[j]) <= 1 &&
                        Math.Abs(_currYCoords[j - 1] - _currYCoords[j]) <= 1) continue;

                    if (_currXCoords[j - 1] > _currXCoords[j])
                        _currXCoords[j] += 1;
                    else if (_currXCoords[j - 1] < _currXCoords[j])
                        _currXCoords[j] -= 1;

                    if (_currYCoords[j - 1] > _currYCoords[j])
                        _currYCoords[j] += 1;
                    else if (_currYCoords[j - 1] < _currYCoords[j])
                        _currYCoords[j] -= 1;

                    if (j == 9) 
                        _tailCoords.Add(Tuple.Create(_currXCoords[j], _currYCoords[j]));
                }
            }
        }

        Console.WriteLine($"{_tailCoords.Distinct().ToList().Count()}");
    }
}
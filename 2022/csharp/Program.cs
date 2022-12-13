using System;

class Aoc2022
{
    public static void Main(string[] args)
    {
        if (args.Length < 2 || !int.TryParse(args[0], out var date) || !int.TryParse(args[1], out var part))
            return;

        switch ((date, part))
        {
            case (9, 1):
                Day9.Part1();
                break;

            case (9, 2):
                Day9.Part2();
                break;

            case (10, 1):
                Day10.Part1();
                break;

            default:
                break;
        }
    }

    public static string[] ReadExampleInput(int date)
    {
        return File.ReadAllLines(Path.Join(Environment.CurrentDirectory, $@"days\{date}\example_input.txt"));
    }

    public static string[] ReadInput(int date)
    {
        return File.ReadAllLines(Path.Join(Environment.CurrentDirectory, $@"days\{date}\input.txt"));
    }
}
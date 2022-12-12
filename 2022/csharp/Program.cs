using System;

class Aoc2022
{
    static public void Main(String[] args)
    {
        if (args.Length < 2 || !Int32.TryParse(args[0], out int date) || !Int32.TryParse(args[1], out int part))
            return;

        switch ((date, part))
        {
            case (9, 1):
                Day9.Part1();
                break;

            case (9, 2):
                Day9.Part2();
                break;

            default:
                break;
        }
    }

    static public String[] ReadExampleInput(int date)
    {
        return File.ReadAllLines(Path.Join(Environment.CurrentDirectory, $@"days\{date}\example_input.txt"));
    }

    static public String[] ReadInput(int date)
    {
        return File.ReadAllLines(Path.Join(Environment.CurrentDirectory, $@"days\{date}\input.txt"));
    }
}
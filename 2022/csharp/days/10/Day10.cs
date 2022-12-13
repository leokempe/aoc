using System.Linq;
using System.Linq.Expressions;
using Microsoft.VisualBasic;

class Day10
{
    public static void Part1()
    {
        var input = Aoc2022.ReadInput(10);

        var register = 1;
        var cycle = 0;

        var signalStrengths = new List<int>();

        var wantedCycles = new List<int>() {20, 60, 100, 140, 180, 220};

        foreach (var line in input)
        {
            for (var i = 0; i < (line == "noop" ? 1 : 2); i++)
            {
                cycle++;
                signalStrengths.Add(cycle * register);
            }

            if (line != "noop")
                register += int.Parse(line.Split(' ').Last());
        }

        var sum = signalStrengths.Where((t, i) => wantedCycles.Contains(i + 1)).Sum();

        Console.WriteLine($"{sum}");
    }

    public static void Part2()
    {
        var input = Aoc2022.ReadInput(10);

        var register = 1;
        var cycle = 0;

        var monitor = new string[40 * 6];

        foreach (var line in input)
        {
            monitor[cycle] = "#";
            for (var i = 0; i < (line == "noop" ? 1 : 2); i++)
            {
                var registerAdd = 40 * Convert.ToInt32((cycle + 1) / 40);
                if (cycle >= register + registerAdd - 1 && cycle < register + registerAdd + 2)
                    monitor[cycle] = "#";
                else
                    monitor[cycle] = ".";
                
                cycle++;
            }

            if (line != "noop")
                register += int.Parse(line.Split(' ').Last());
        }

        var output = "";
        for (var i = 0; i < monitor.Length; i++)
        {
            output += monitor[i];

            if (i != 39 && (i + 1) % 40 != 0) continue;

            Console.WriteLine(output);
            output = "";
        }
    }
}
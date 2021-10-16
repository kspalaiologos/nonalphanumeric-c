
my @a = ();
# Slurp everything from STDIN.
$_ = do { local $/; <STDIN> };
# Remove garbage left after gcc.
s/^#.*$//gm;
# Process "%define" statements.
s/^%define[ \t]+([A-Za-z_][A-Za-z0-9_]*)$/push(@a, $1);"";/gem;
# Strip newlines (they must be replaced with a space, because
# a space is functionally equal to a newline by the C standard).
s/\n/ /g;
# Input for the APL program.
# First line - defined stuff
print (join " ",@a);print "\n";
# Second line - the code with leading/trailing whitespace removed.
s/^\s+|\s+$//g;print;print "\n";

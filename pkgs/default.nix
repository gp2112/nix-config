# When you add custom packages, list them here
{ pkgs }: {
  netkit = pkgs.callPackage ./netkit { };
  json-prettify = (pkgs.writeScriptBin "json-prettify" ''
      #!${pkgs.python3}/bin/python
      import json
      import sys

      def main():
          try:
              fname = sys.argv[1]
              f = open(fname)
          except IndexError:
              f = sys.stdin
          
          data = json.load(f)
          print(json.dumps(data, indent=4))

      if __name__ == '__main__':
          main()
    '');
}

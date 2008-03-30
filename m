Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1Jg6n7-0004U5-A6
	for openembedded-devel@openembedded.org; Mon, 31 Mar 2008 01:18:22 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m2UNIK09027567
	for <openembedded-devel@openembedded.org>;
	Mon, 31 Mar 2008 00:18:20 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 27272-08 for <openembedded-devel@openembedded.org>;
	Mon, 31 Mar 2008 00:18:16 +0100 (BST)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m2UNIBxS027549
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Mon, 31 Mar 2008 00:18:11 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel <openembedded-devel@openembedded.org>
Date: Mon, 31 Mar 2008 00:18:12 +0100
Message-Id: <1206919092.4838.23.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Old bitkeeper repository
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 30 Mar 2008 23:18:26 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

I've been experimenting with the bitkeeper cvs dump we have of the OE
repository that was there. I'm planning on turning this into a git
repository so we can more easily see what was in there.

One of the things it pays to do is to convert the rather insane
bitkeeper userids to something sane. I've made a list of the IDs below
and I can guess who a lot of them are.

The main question is whether we use real email addresses with these or
some kind of made up alias? I've stuck a few email addresses in for
experimentation locally but in most cases I've used irc nicknames.

If we did switch to git/hg/scm of the month, what commit ids would we
want to be using?

Any help with filling in the blanks (or any corrections) welcome.

Cheers,

Richard

    'accelent.com!cbrake' : ('Cliff Brake', 'cbrake@'),
    'amd.com!jcrouse' : ('Jordan Crouse', 'cosmicpenguin@'),
    'brooks.edu!ggilbert' : ('Greg Gilbert', 'treke@'),
    'com[kergoth]!kergoth' : ('Chris Larson', 'kergoth@'),
    'com[tim]!mithro' : ('Tim Ansell', 'mithro@'),
    'de[mickey]!mickey' : ("Michael 'Mickey' Lauer", 'mickey@vanille-media.de'),
    'de[mickey]!mickeyl' : ("Michael 'Mickey' Lauer", 'mickey@vanille-media.de'),
    'de[pb_]!pb_' : ('Phil Blundell', 'pb_@'),
    'direwolf!kergoth' : ('Chris Larson', 'kergoth@'),
    'doomcom.org!gbritton' : ('Gerald Britton', 'gbritton@'),
    'dyndns.org!oe' : ('Rene Wagner', 'reenoo@'),
    'dyndns.org!reenoo' : ('Rene Wagner', 'reenoo@'),
    'example.net!root' : ('Richard Purdie', 'rpurdie@rpsys.net'),
    'example.net!RP' : ('Richard Purdie', 'rpurdie@rpsys.net'),
    'handhelds.org!CoreDump' : ('Matthias Hentges', 'CoreDump@'),
    'handhelds.org!kergoth' : ('Chris Larson', 'kergoth@'),
    'handhelds.org!zecke' : ('Holger Freyther', 'zecke@'),
    'homelinux.net!schurig' : ('Holger Schurig', 'schurig'),
    'hrw.one.pl!hrw' : ('Marcin Juszkiewicz', 'hrw@'),
    'hrw.one.pl!szczepan' : ('Marcin Juszkiewicz', 'hrw@'),
    'hyboria!xora' : ('Graeme Gregory', 'XorA@'),
    'joshuawise.com!joshua' : ('Joshua Wise', 'joshua@'),
    'kalmiopsis!jbowler' : ('John Bowler', 'jbowler@'),
    'kergoth.com!kergoth' : ('Chris Larson', 'kergoth@'),
    'local!CoreDump' : ('Matthias Hentges', 'CoreDump@'),
    'local!hrw' : ('Marcin Juszkiewicz', 'hrw@'),
    'local[kergoth]!kergoth' : ('Chris Larson', 'kergoth@'),
    'local!kergoth' : ('Chris Larson', 'kergoth@'),
    'local!mhentges' : ('Matthias Hentges', 'CoreDump@'),
    'local!szczepan' : ('Marcin Juszkiewicz', 'hrw@'),
    'mithis.com!buildroot' : ('Tim Ansell', 'mithro@'),
    'mithis.com!mithro' : ('Tim Ansell', 'mithro@'),
    'mn-logistik.de!schurig' : ('Holger Schurig', 'schurig'),
    'mn-solutions.de!schurig' : ('Holger Schurig', 'schurig'),
    'nexus.co.uk!pb' : ('Phil Blundell', 'pb_@'),
    '(none)!br1' : ('Bruno Randolf', 'br1@'),
    '(none)!cwiiis' : ('Chris Lord', 'cwiiis@'),
    '(none)!dereky' : ('Derek Young', 'dyoung@'),
    '(none)!dyoung' : ('Derek Young', 'dyoung@'),
    '(none)!ggilbert' : ('Greg Gilbert', 'treke@'),
    '(none)!ich' : ('Holger Freyther', 'zecke@'),
    '(none)!kergoth' : ('Chris Larson', 'kergoth@'),
    '(none)!koen' : ('Koen Kooi', 'koen@'),
    '(none)!lpotter' : ('Lorn Potter', 'lpotter@'),
    '(none)!mallum' : ('Matthew Allum', 'mallum@'),
    '(none)!pb' : ('Phil Blundell', 'pb_@'),
    '(none)!rwhitby' : ('Rob Whitby', 'rwhitby@'),
    '(none)!xora' : ('Graeme Gregory', 'XorA@'),
    '(none)!XorA' : ('Graeme Gregory', 'XorA@'),
    'opfer.lan!dirk' : ('Dirk Opfer', 'do13@'),
    'orange!noodles' : ('Jonathan McDowell', 'noodles@'),
    'org[gbritton]!gbritton' : ('Gerald Britton', 'gbritton@'),
    'org[kergoth]!kergoth' : ('Chris Larson', 'kergoth@'),
    'reciva.com!pb' : ('Phil Blundell', 'pb_@'),
    'rpsys.net!anon' : ('Richard Purdie', 'rpurdie@rpsys.net'),
    'rpsys.net!root' : ('Richard Purdie', 'rpurdie@rpsys.net'),
    'rpsys.net!RP' : ('Richard Purdie', 'rpurdie@rpsys.net'),
    'rr.com!cbrake' : ('Cliff Brake', 'cbrake@'),
    'rwhitby.net!rwhitby' : ('Rob Whitby', 'rwhitby@'),
    'ti.com!a0868066' : ('Chris Larson', 'kergoth@'),
    'ti.com!kergoth' : ('Chris Larson', 'kergoth@'),
    'ti.com!patch' : ('Chris Larson', 'kergoth@'),
    'treke.ath.cx!ggilbert' : ('Greg Gilbert', 'treke@'),
    'treke.net!ggilbert' : ('Greg Gilbert', 'treke@'),
    'trolltech.com.au!lpotter' : ('Lorn Potter', 'lpotter@'),
    'tuxnami.org!kergoth' : ('Chris Larson', 'kergoth@'),
    'uk[pb]!pb' : ('Phil Blundell', 'pb_@'),
    'uni-frankfurt.de!mickeyl' : ("Michael 'Mickey' Lauer", 'mickey@vanille-media.de'),
    'uni-frankfurt.de!mickey' : ("Michael 'Mickey' Lauer", 'mickey@vanille-media.de'),
    'uni-frankfurt.de!patch' : ("Michael 'Mickey' Lauer", 'mickey@vanille-media.de'),
    'uni-frankfurt.de!pb_' : ('Phil Blundell', 'pb_@'),
    'utwente.nl!koen' : ('Koen Kooi', 'koen@'),
    'vanille.de!mickeyl' : ("Michael 'Mickey' Lauer", 'mickey@vanille-media.de'),
    'vanille.de!mickey' : ("Michael 'Mickey' Lauer", 'mickey@vanille-media.de'),
    'void!koen' : ('Koen Kooi', 'koen@'),

    '1.34!tigrux' : ('', ''),
    'apache' : ('', ''),
    'bitkeeper.com!nslu2-linux.adm' : ('', ''),
    'bkbits.net!nslu2-linux.adm' : ('', ''),
    'black.lan!peteru' : ('', ''),
    '!ByronT' : ('', ''),
    'cambridgebroadband.com!rjt' : ('', ''),
    'conversagent.com!fontenot' : ('', ''),
    'doma!kebert' : ('', ''),
    'giantshoulder.com!g2' : ('', ''),
    'home!ral' : ('', ''),
    'kano.org.uk!timh' : ('', ''),
    'labotomy.net!emte' : ('', ''),
    'local!phillim' : ('', ''),
    'mine.nu!erich' : ('', ''),
    '(none)!chris' : ('', ''),
    '(none)!chriz' : ('', ''),
    '(none)!dp' : ('', ''),
    '(none)!emte' : ('', ''),
    '(none)!jacques' : ('', ''),
    '(none)!openembedded' : ('', ''),
    '(none)!pablo' : ('', ''),
    '(none)!patrick' : ('', ''),
    '(none)!red' : ('', ''),
    '(none)!root' : ('', ''),
    '(none)!unslung' : ('', ''),
    '(none)!wind' : ('', ''),
    '(none)!xf005570' : ('', ''),
    'nslu2-linux.org!perlguru' : ('', ''),
    'rant-central.com!CodeWhacker' : ('', ''),
    'rant-central.com!roy' : ('', ''),
    'rochcivictheatre.org!tgall' : ('', ''),
    'techsurgeons.com!joshin' : ('', ''),
    'tetrapyloctomy.org!p.osiczko' : ('', ''),
    'thegrantclan.org!jgrant' : ('', ''),
    'uottawa.ca!stephane' : ('', ''),
    '!xf005570' : ('', ''),
    'zeckescompany.nl!alwin' : ('', ''),





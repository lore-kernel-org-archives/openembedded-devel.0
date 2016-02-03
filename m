Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 3F6E177230
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Feb 2016 20:12:15 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id p63so87450988wmp.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Feb 2016 12:12:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:subject:date:message-id:to:mime-version;
	bh=Opgykj0ifDQjZkoRMlkKCLOQB3At2AGiRlERGb+ddM0=;
	b=yJFDJoP/GBDadYSi7MWKpyguVAkO4kh0rIYVCt4WbbbsgHSx7Tp1s8Ih3Aa4fPM4RS
	mdwqckxXK48EKxfeqs/nUpIIHCSAJGl9IKTEjc1QlKctPxGnIstJe7/rMcDleUcu5Fb0
	Ws/9rXlRNHfSBCX1G03mOMYlZFIKS4DrfQm6IHyd+Ka29PCypYlhPQ2EP6grtofh4VAz
	wsNYWerewYlDHBWj10582y8pvJCUndJAfed0qEnp+7OWkEWEJazCbBrXrS6HPkviunas
	hRpuyL8CPRfkLRqTwn737sXIUmaVmhdwue/y0b8lf2ifmjRP7IXPnHjZU8fDJ2lRarvc
	QOZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:content-type:subject:date:message-id:to
	:mime-version;
	bh=Opgykj0ifDQjZkoRMlkKCLOQB3At2AGiRlERGb+ddM0=;
	b=ebCjuUVJDLGHjRW874XxVhRbWCs23DapbOYSvHaZVkxIDPRotrH7Z/hUqzyWNCtk6n
	aOMNbhauqyOS7bUWozZDie0TZh10zhxnUIOu29SOZwd/LWj7n3U/DBg8h8wuG+9s/mIo
	PfeC02jkznmjq6v4I2nOsE7XCPhlUTs6jQjDGP2SVTuM35EmpmHsicWHFOudxUao28xI
	pMLAJ6hnAPESqte4RkjbB/qj6RMB7AHX/kX3/WlXml1wAKLA/osPEPyv0Wyf3OsZKVNH
	O85kBNqgYIKFxyOH0wbytWlykXYSDkqHqnaTlkJ7N8+n0aKAjpVedRvHU7bN9Fg/dBQJ
	qHCQ==
X-Gm-Message-State: AG10YORN0FxA7/fOObDiQyGRt9n5plf7ewubeYGeEKIB7Wc+fb5hW7hJe09wJBmYz/syvQ==
X-Received: by 10.194.119.161 with SMTP id kv1mr3909269wjb.135.1454530335331; 
	Wed, 03 Feb 2016 12:12:15 -0800 (PST)
Received: from ernie.rdm.local (rademacherexchange.de. [46.245.221.222])
	by smtp.gmail.com with ESMTPSA id n5sm9486307wmf.3.2016.02.03.12.12.14
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 03 Feb 2016 12:12:14 -0800 (PST)
From: Jens Rehsack <rehsack@gmail.com>
X-Pgp-Agent: GPGMail 2.6b2
Date: Wed, 3 Feb 2016 21:12:12 +0100
Message-Id: <A8DC1FDD-C832-4AF0-B282-77430FBE0685@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Mailer: Apple Mail (2.3112)
Subject: [meta-cpan] Updates pushed
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 03 Feb 2016 20:12:18 -0000
X-Groupsio-MsgNum: 59833
Content-Type: multipart/signed;
	boundary="Apple-Mail=_14084FE6-8B19-42F3-9DD7-A245E42FEB2B";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_14084FE6-8B19-42F3-9DD7-A245E42FEB2B
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

I pushed following commits to meta-cpan =
(http://github.com/rehsack/meta-cpan/), master and jethro branches (if =
someone cares ...):

commit 1d6003bd661ffbecab5699ee6b85f16ba001e8a6
Author: Jens Rehsack <sno@netbsd.org>
Date:   Wed Feb 3 13:44:03 2016 +0100

    io-socket-ssl-perl: Update to 2.023

    Update recipe for CPAN hosted Perl5 module IO::Socket::SSL from =
2.022 to 2.023.

    Changes since 2.022: =
https://metacpan.org/source/SULLR/IO-Socket-SSL-2.023/Changes

    Signed-off-by: Jens Rehsack <sno@netbsd.org>

commit 6652b9223be372892ab26c117438270001ab2dc2
Author: Jens Rehsack <sno@netbsd.org>
Date:   Wed Feb 3 13:18:22 2016 +0100

    exception-class-perl: Update to 1.40

    Update recipe for CPAN hosted Perl5 module Exception::Class from =
1.39 to 1.40.
    Mark resulting packages as allarch.

    Changes since 1.39: =
https://metacpan.org/source/DROLSKY/Exception-Class-1.40/Changes

    Signed-off-by: Jens Rehsack <sno@netbsd.org>

commit 9842fbe6ced75206a0bea441165626fef3dc8344
Author: Jens Rehsack <sno@netbsd.org>
Date:   Thu Jan 28 21:19:08 2016 +0100

    dancer2-plugin-database-perl: Update to 2.15

    Update recipe for CPAN hosted Perl5 module Dancer2::Plugin::Database =
2.12 to 2.15.
    Mark resulting packages as allarch.

    Changes since 2.12: =
https://metacpan.org/source/AMBS/Dancer2-Plugin-Database-2.15/Changes

    Signed-off-by: Jens Rehsack <sno@netbsd.org>

commit 9f350c002503679974836c40dd7cfad0bbabad2d
Author: Jens Rehsack <sno@netbsd.org>
Date:   Thu Jan 28 21:16:46 2016 +0100

    dancer-plugin-database-core-perl: Update to 0.14

    Update recipe for CPAN hosted Perl5 module =
Dancer::Plugin::Database::Core from 0.11 to 0.14.
    Mark resulting packages as allarch.

    Changes since 0.11: =
https://metacpan.org/source/AMBS/Dancer-Plugin-Database-Core-0.14/Changes

    Signed-off-by: Jens Rehsack <sno@netbsd.org>

commit 4e76659bb3b504fa49424177210c75fee1913059
Author: Jens Rehsack <sno@netbsd.org>
Date:   Thu Jan 28 21:14:54 2016 +0100

    apache-logformat-compiler-perl: Update to 0.33

    Update recipe for CPAN hosted Perl5 module =
Apache::LogFormat::Compiler from 0.32 to 0.33.
    Mark resulting packages as allarch.

    Changes since 0.32: =
https://metacpan.org/source/KAZEBURO/Apache-LogFormat-Compiler-0.33/Change=
s

    Signed-off-by: Jens Rehsack <sno@netbsd.org>

commit 1a556e43396065b7677b5bf2cf2976822b9b73e8
Author: Jens Rehsack <sno@netbsd.org>
Date:   Thu Jan 28 16:52:16 2016 +0100

    dancer2-perl: Update to 0.166001

    Update recipe for CPAN hosted Perl5 module Dancer2 from 0.161000 to =
0.166001.
    Mark resulting packages as allarch.

    Changes since 0.161000: =
https://metacpan.org/source/XSAWYERX/Dancer2-0.166001/Changes

    Signed-off-by: Jens Rehsack <sno@netbsd.org>

commit 584e228ae84a445c90e9ca1d36d24110f67be0ec
Author: Jens Rehsack <sno@netbsd.org>
Date:   Thu Jan 28 16:42:36 2016 +0100

    server-starter-perl: Update to 0.32

    Update recipe for CPAN hosted Perl5 module Server::Starter from 0.31 =
to 0.32.
    Mark resulting packages as allarch.

    Changes since 0.31: =
https://metacpan.org/source/KAZUHO/Server-Starter-0.32/Changes

    Signed-off-by: Jens Rehsack <sno@netbsd.org>

commit deb2f7b663fcc7115e032d8935a2269863695337
Author: Jens Rehsack <sno@netbsd.org>
Date:   Thu Jan 28 16:40:33 2016 +0100

    plack-perl: Update to 1.0039

    Update recipe for CPAN hosted Perl5 module Plack from 1.0037 to =
1.0039.
    Mark resulting packages as allarch.

    Changes since 1.0037: =
https://metacpan.org/source/MIYAGAWA/Plack-1.0039/Changes

    Signed-off-by: Jens Rehsack <sno@netbsd.org>

commit 019943312feb82fd36c14a16eaa3e7c8878442c6
Author: Jens Rehsack <sno@netbsd.org>
Date:   Thu Jan 28 16:25:59 2016 +0100

    http-headers-fast-perl: Update to 0.20

    Update recipe for CPAN hosted Perl5 module HTTP::Headers::Fast from =
0.18 to 0.20.
    Mark resulting packages as allarch.

    Changes since 0.18: =
https://metacpan.org/source/TOKUHIROM/HTTP-Headers-Fast-0.20/Changes

    Signed-off-by: Jens Rehsack <sno@netbsd.org>

commit dd8e9566a868c978cf6548f6644ecf6d759f0df3
Author: Jens Rehsack <sno@netbsd.org>
Date:   Thu Jan 28 16:12:53 2016 +0100

    html-parser-perl: Update to 3.72

    Update recipe for CPAN hosted Perl5 module HTML::Parser from 3.71 to =
3.72:

    Changes since 3.71: =
https://metacpan.org/source/GAAS/HTML-Parser-3.72/Changes

    Signed-off-by: Jens Rehsack <sno@netbsd.org>

commit 1044374158b1ab9159535e0d3bad8dab2c17339b
Author: Jens Rehsack <sno@netbsd.org>
Date:   Thu Jan 28 16:10:54 2016 +0100

    http-message-perl: Update to 6.11

    Update recipe for CPAN hosted Perl5 module HTTP::Message from 6.10 =
to 6.11.
    Mark resulting packages as allarch.

    Changes since 6.10: =
https://metacpan.org/source/ETHER/HTTP-Message-6.11/Changes

    Signed-off-by: Jens Rehsack <sno@netbsd.org>

commit 850774735ff53edb081fb01ea302a041ae92fc6b
Author: Jens Rehsack <sno@netbsd.org>
Date:   Thu Jan 28 16:06:03 2016 +0100

    libwww-perl-perl: Update to 6.15

    Update recipe for CPAN hosted Perl5 module LWP from 6.13 to 6.15.
    Mark resulting packages as allarch.

    Changes since 6.13: =
https://metacpan.org/source/ETHER/libwww-perl-6.15/Changes

    Signed-off-by: Jens Rehsack <sno@netbsd.org>

commit ea31bb95f4144825479fc83f35a6ab5b2bfc494f
Author: Jens Rehsack <sno@netbsd.org>
Date:   Thu Jan 28 15:57:56 2016 +0100

    uri-perl: Update to 1.71

    Update recipe for CPAN hosted Perl5 module URI from 1.69 to 1.71.
    Mark resulting packages as allarch.

    Changes since 1.69: =
https://metacpan.org/source/ETHER/URI-1.71/Changes

    Signed-off-by: Jens Rehsack <sno@netbsd.org>

commit c982cc4de9c39459bf4cb08c3c493873207f086b
Author: Jens Rehsack <sno@netbsd.org>
Date:   Thu Jan 28 14:05:57 2016 +0100

    unicode-linebreak-perl: Update to 2015.12

    Update recipe for CPAN hosted Perl5 module Unicode::LineBreak from =
2015.06 to 2015.12.

    Changes since 2015.06: =
https://metacpan.org/source/NEZUMI/Unicode-LineBreak-2015.12/Changes

    Signed-off-by: Jens Rehsack <sno@netbsd.org>

commit 0f6e9b856a8516e301d296662985b99c5e3aa31d
Author: Jens Rehsack <sno@netbsd.org>
Date:   Thu Jan 28 14:01:21 2016 +0100

    text-csv-xs-perl: Update to 1.21

    Update recipe for CPAN hosted Perl5 module Text::CSV_XS from 1.19 to =
1.21.

    Changes since 1.19: =
https://metacpan.org/source/HMBRAND/Text-CSV_XS-1.21/ChangeLog

    Signed-off-by: Jens Rehsack <sno@netbsd.org>

commit 402979d105380bc5bb92866ec49714c296da232c
Author: Jens Rehsack <sno@netbsd.org>
Date:   Thu Jan 28 13:58:23 2016 +0100

    string-compare-constanttime-perl: Update to 0.311

    Update recipe for CPAN hosted Perl5 module =
String::Compare::ConstantTime from 0.310 to 0.311.

    Changes since 0.310: =
https://metacpan.org/source/FRACTAL/String-Compare-ConstantTime-0.311/Chan=
ges

    Signed-off-by: Jens Rehsack <sno@netbsd.org>

commit 1170665defa14631c4a508e51034ae5ff72d4e25
Author: Jens Rehsack <sno@netbsd.org>
Date:   Thu Jan 28 13:56:12 2016 +0100

    sereal-encoder-perl: Update to 3.014

    Update recipe for CPAN hosted Perl5 module Sereal::Encoder from =
3.005 to 3.014.

    Changes since 3.005: =
https://metacpan.org/source/YVES/Sereal-Encoder-3.014/Changes

    Signed-off-by: Jens Rehsack <sno@netbsd.org>

commit d1e36aaa518949931c4c257ac3b676b39c438642
Author: Jens Rehsack <sno@netbsd.org>
Date:   Thu Jan 28 13:54:30 2016 +0100

    sereal-decoder-perl: Update to 3.014

    Update recipe for CPAN hosted Perl5 module Sereal::Decoder from =
3.005 to 3.014.

    Changes since 3.005: =
https://metacpan.org/source/YVES/Sereal-Decoder-3.014/Changes

    Signed-off-by: Jens Rehsack <sno@netbsd.org>

commit 0a5c46c792757a91ff8d3547a1751fd8d530bd36
Author: Jens Rehsack <sno@netbsd.org>
Date:   Thu Jan 28 13:50:49 2016 +0100

    regexp-common-perl: Update to 2016010801

    Update recipe for CPAN hosted Perl5 module Regexp::Common from =
2013031301 to 2016010801.
    Mark resulting packages allarch.

    Changes since 2013031301: =
https://metacpan.org/source/ABIGAIL/Regexp-Common-2016010801/Changes

    Signed-off-by: Jens Rehsack <sno@netbsd.org>

commit 6ce4982543107e76aca94030c48d35eb11403cf8
Author: Jens Rehsack <sno@netbsd.org>
Date:   Thu Jan 28 13:48:01 2016 +0100

    encode-perl: Update to 2.80

    Update CPAN hosted Perl5 module Encode from 2.76 to 2.80.

    Changes since 2.76: =
https://metacpan.org/source/DANKOGAI/Encode-2.80/Changes

    Signed-off-by: Jens Rehsack <sno@netbsd.org>

commit efbbf1a90b3d0a9255aa0e1bf8182510e71a9976
Author: Jens Rehsack <sno@netbsd.org>
Date:   Thu Jan 28 13:43:51 2016 +0100

    test-differences-perl: Update to 0.64.

    Update CPAN hosted Perl5 module Test::Differences from 0.63 to 0.64
    Mark resulting packages as allarch

    Changes since 0.63: =
https://metacpan.org/source/DCANTRELL/Test-Differences-0.64/Changes

    Signed-off-by: Jens Rehsack <sno@netbsd.org>

commit dcda54f71d0f42ceaffd7da9770e5e4080bde29e
Author: Jens Rehsack <sno@netbsd.org>
Date:   Thu Jan 28 13:41:10 2016 +0100

    text-diff-perl: Update to 1.43

    Update CPAN hosted Perl5 package Text::Diff from 1.41 to 1.43.
    Mark resulting packages as allarch.

    Changes since 1.43: =
https://metacpan.org/source/NEILB/Text-Diff-1.43/Changes

    Signed-off-by: Jens Rehsack <sno@netbsd.org>

commit 92b3b62d9b8f7fb9de9e3bd1c8092e6933348b9d
Author: Jens Rehsack <sno@netbsd.org>
Date:   Thu Jan 28 13:37:26 2016 +0100

    business-isbn-perl: Update to 2.010

    Update CPAN hosted Perl5 module Business::ISBN from 2.09 to 2.010.
    Mark resulting packages as allarch. Remove daisy-supporting =
no-eumm-version.patch

    Changes since 2.09: =
https://metacpan.org/source/BDFOY/Business-ISBN-2.010/Changes

    Signed-off-by: Jens Rehsack <sno@netbsd.org>

commit 1917b7aa91d198592d915a12ebacff8f374d259f
Author: Jens Rehsack <sno@netbsd.org>
Date:   Thu Jan 28 13:27:52 2016 +0100

    business-isbn-data-perl: Update to 20140910.003

    Update CPAN hosted Perl5 module Business::ISBN::Data from =
20140910.002 to 20140910.003.
    Mark resulting package as allarch and remove daisy-supporting =
no-eumm-version.patch

    Changes since 20140910.002: =
https://metacpan.org/source/BDFOY/Business-ISBN-Data-20140910.003/Changes

    Signed-off-by: Jens Rehsack <sno@netbsd.org>

commit d2dfc88a141f5df97dda7e13e553a54d273f0850
Author: Jens Rehsack <sno@netbsd.org>
Date:   Thu Jan 28 12:51:37 2016 +0100

    datetime-timezone-perl: Update to 1.95

    Update CPAN hosted Perl5 module DateTime::TimeZone from 1.94 to =
1.05.

    Changes since 1.94: =
https://metacpan.org/source/DROLSKY/DateTime-TimeZone-1.95/Changes

    Signed-off-by: Jens Rehsack <sno@netbsd.org>

commit 799f4b9a1f69c08e465f945e69eb75be2f36a8ad
Author: Jens Rehsack <sno@netbsd.org>
Date:   Thu Jan 28 12:42:14 2016 +0100

    test-memory-cycle-perl: Update to 1.06

    Update CPAN hosted Perl5 module Test::Memory::Cycle from 1.04 to =
1.06.
    Mark resulting packages as allarch.

    Changes since 1.04: =
https://metacpan.org/source/PETDANCE/Test-Memory-Cycle-1.06/Changes

    Signed-off-by: Jens Rehsack <sno@netbsd.org>

commit f13cd930019fdbb7e002c2f7dc7eb55a61bef3f4
Author: Jens Rehsack <sno@netbsd.org>
Date:   Thu Jan 28 12:38:52 2016 +0100

    test-warnings-perl: Update to 0.026

    Update CPAN hosted Perl5 module Test::Warnings from 0.025 to 0.026.

    Changes since 0.025: =
https://metacpan.org/source/ETHER/Test-Warnings-0.026/Changes

    Signed-off-by: Jens Rehsack <sno@netbsd.org>

commit 0ff8e914cbe18641c73a27e279c2956862a25fd2
Author: Jens Rehsack <sno@netbsd.org>
Date:   Wed Jan 27 20:52:53 2016 +0100

    datetime-format-duration-perl: Add recipe for =
DateTime::Format::Duration 1.04.

    Add recipe for CPAN hosted Perl5 module DateTime::Format::Duration =
version 1.04.

    DateTime::Format::Duration formats and parses DateTime::Duration =
objects
    as well as other durations representations.

    Signed-off-by: Jens Rehsack <sno@netbsd.org>

commit 6f42d8350c072a4cdefb5bceb17094ab75f50650
Author: Jens Rehsack <sno@netbsd.org>
Date:   Wed Jan 27 20:49:17 2016 +0100

    datetime-format-strptime-perl: Update to 1.63

    Update CPAN hosted Perl5 module DateTime::Format::Strptime from 1.56 =
to 1.63.
    Mark resulting packages as allarch.

    Changes since 1.56: =
https://metacpan.org/source/DROLSKY/DateTime-Format-Strptime-1.63/Changes

    Signed-off-by: Jens Rehsack <sno@netbsd.org>

commit d7732f1d6452c85312eb117ef7f8063a6259441c
Author: Jens Rehsack <sno@netbsd.org>
Date:   Wed Jan 27 20:44:36 2016 +0100

    datetime-locale-perl: Update to 1.02

    Update CPAN hosted Perl5 module DateTime::Locale from 0.46 to 1.02.
    Mark resulting packages as allarch.

    Changes since 0.46: =
https://metacpan.org/source/DROLSKY/DateTime-Locale-1.02/Changes

    Signed-off-by: Jens Rehsack <sno@netbsd.org>

commit 0c84308b477b5b080ce012ea9908d2bd42742d2c
Author: Jens Rehsack <sno@netbsd.org>
Date:   Wed Jan 27 20:40:21 2016 +0100

    datetime-timezone-perl: Update to 1.94

    Update CPAN hosted Perl5 package DateTime::TimeZone from 1.92 to =
1.94.
    Mark resulting packages as allarch.

    Changes since 1.92: =
https://metacpan.org/source/DROLSKY/DateTime-TimeZone-1.94/Changes

    Signed-off-by: Jens Rehsack <sno@netbsd.org>

commit c5e0c90520bc92ec7fe1a15cefbdabdf13030d23
Author: Jens Rehsack <sno@netbsd.org>
Date:   Wed Jan 27 20:35:03 2016 +0100

    datetime-perl: Update to 1.21

    Update recipe for CPAN hosted Perl5 package DateTime.
    Mark resulting packages as allarch.

    Changes since 1.20: =
https://metacpan.org/source/DROLSKY/DateTime-1.21/Changes

    Signed-off-by: Jens Rehsack <sno@netbsd.org>

commit 69019fa8a9ba8cddacd16f72f00262cf441d173f
Author: Jens Rehsack <sno@netbsd.org>
Date:   Wed Jan 27 20:25:31 2016 +0100

    test-tcp-perl: Update to 2.14

    Upate CPAN hosted Perl5 module Test::TCP from 2.13 to 2.14
    Mark resulting packages as allarch

    Changes since 2.13: =
https://metacpan.org/source/TOKUHIROM/Test-TCP-2.14/Changes

    Signed-off-by: Jens Rehsack <sno@netbsd.org>

commit 6d5459d5a44c4fbb4eb552f88f19ed987997a731
Author: Jens Rehsack <sno@netbsd.org>
Date:   Wed Jan 27 20:21:18 2016 +0100

    socket-perl: Update to 2.021

    Update CPAN hosted Perl5 module Socket from 2.020 to 2.021.

    Changes since 2.020: =
https://metacpan.org/source/PEVANS/Socket-2.021/Changes

    Signed-off-by: Jens Rehsack <sno@netbsd.org>

commit fb4d640da224abd8e2cd897cce38d2e38c3a28aa
Author: Jens Rehsack <sno@netbsd.org>
Date:   Wed Jan 27 20:18:49 2016 +0100

    net-async-http-server-perl: Update to 0.09

    Update CPAN hosted Perl5 package Net::Async::HTTP::Server from 0.08 =
to 0.09.
    Mark resulting packages as allarch.

    Changes since 0.08: =
https://metacpan.org/source/PEVANS/Net-Async-HTTP-Server-0.09/Changes

    XXX: Split package for Plack::Handler::Net::Async::HTTP::Server

    Signed-off-by: Jens Rehsack <sno@netbsd.org>

commit 67adb53fd4c609203b38f293c7aa08e0ce5fd478
Author: Jens Rehsack <sno@netbsd.org>
Date:   Wed Jan 27 20:10:03 2016 +0100

    io-socket-ssl-perl: Update to 2.022

    Upate CPAN hosted Perl5 module IO::Socket::SSL from 2.016 to 2.022.
    Mark resulting packages as allarch.

    Changes since 2.016: =
https://metacpan.org/source/SULLR/IO-Socket-SSL-2.022/Changes

    Signed-off-by: Jens Rehsack <sno@netbsd.org>

commit a1867f656a014acfded3a7b663387768b71c0da7
Author: Jens Rehsack <sno@netbsd.org>
Date:   Wed Jan 27 20:04:18 2016 +0100

    data-uuid-perl: Update to 1.221

    Update CPAN hosted Perl5 module Data::UUID from 1.220 to 1.221.

    Changes since 1.220: =
https://metacpan.org/source/RJBS/Data-UUID-1.221/Changes

    Signed-off-by: Jens Rehsack <sno@netbsd.org>

commit 13bfb698218aa24c9e4b3dc593fd4526a715185b
Author: Jens Rehsack <sno@netbsd.org>
Date:   Wed Jan 27 19:46:32 2016 +0100

    io-async-perl: Update to 0.70

    Update CPAN hosted Perl5 package IO::Async from 0.68 to 0.70.
    Mark resulting packages as allarch.

    Changes since 0.68: =
https://metacpan.org/source/PEVANS/IO-Async-0.70/Changes

    Signed-off-by: Jens Rehsack <sno@netbsd.org>

commit b6a0f98993e167dc02607e6c31cea7a9506a38be
Author: Jens Rehsack <sno@netbsd.org>
Date:   Wed Jan 27 19:41:37 2016 +0100

    file-libmagic-perl: Update to 1.15

    Update CPAN hosted Perl5 module File::LibMagic from 1.13 to 1.15.

    Changes since 1.13: =
https://metacpan.org/source/DROLSKY/File-LibMagic-1.15/Changes

    Signed-off-by: Jens Rehsack <sno@netbsd.org>

commit 1bcb2a15c68d228e5284d9fb1ddd5be58ecbb087
Author: Jens Rehsack <sno@netbsd.org>
Date:   Wed Jan 27 19:37:30 2016 +0100

    net-ssleay-perl: Update to 1.72

    Updating CPAN hosted Perl5 module Net::SSLeay from 1.70 to 1.72.

    Changes since 1.70: =
https://metacpan.org/source/MIKEM/Net-SSLeay-1.72/Changes

    Signed-off-by: Jens Rehsack <sno@netbsd.org>

commit bf9b374fa6627f2f20b870084cf1652a2eb1e87d
Author: Jens Rehsack <sno@netbsd.org>
Date:   Wed Jan 27 19:31:25 2016 +0100

    number-tolerant-perl: Update to 1.708

    Update CPAN hosted Perl5 module Number::Tolerant from 1.707 to =
1.708.
    Mark resulting packages as allarch.

    Changes since 1.707: =
https://metacpan.org/source/RJBS/Number-Tolerant-1.708/Changes

    Signed-off-by: Jens Rehsack <sno@netbsd.org>

commit dc53351f34776ce6dc82b61b1ca545de85d31368
Author: Jens Rehsack <sno@netbsd.org>
Date:   Wed Jan 27 19:26:57 2016 +0100

    math-planepath-perl: Update to 122

    Update CPAN hosted Perl5 module Math::PlanePath from 119 to 112.
    Mark resulting packages as allarch

    Changes since 119: =
https://metacpan.org/source/KRYDE/Math-PlanePath-122/Changes

    Signed-off-by: Jens Rehsack <sno@netbsd.org>

commit 77f444750feec7b35fa148a6114fc667357a12d7
Author: Jens Rehsack <sno@netbsd.org>
Date:   Wed Jan 27 19:22:12 2016 +0100

    mozilla-ca-perl: Update to 20160104

    Update CPAN hosted Perl5 module Mozilla::CA from 20150826 to =
20160104.
    Mark resulting packages as allarch.

    Changes since 20150826: =
https://metacpan.org/changes/distribution/Mozilla-CA

    Signed-off-by: Jens Rehsack <sno@netbsd.org>

commit 6b79839e868ef3416b354b19895b1f27d5250fb4
Author: Jens Rehsack <sno@netbsd.org>
Date:   Wed Jan 27 17:48:02 2016 +0100

    app-cmd-perl: fix license deploy regression

    Due SPDX introduction in OE-Core (somewhere between daisy and =
jethro) the
    original license templating of Package::Utils doesn't work anymore. =
Fix ...

    Signed-off-by: Jens Rehsack <sno@netbsd.org>

commit 91fcfdb830076ee7ee942dfa2d0e7d315b1ec5d5
Author: Jens Rehsack <sno@netbsd.org>
Date:   Wed Jan 27 17:46:02 2016 +0100

    file-find-rule-perl: Update to 0.33

    Update recipe for CPAN hosted Perl5 module File::Find::Rule from =
0.33 to 0.34.
    Mark resulting packages as allarch.

    Changes since 0.33: =
https://metacpan.org/source/RCLAMP/File-Find-Rule-0.34/Changes

    Signed-off-by: Jens Rehsack <sno@netbsd.org>

commit 84090d306f4c6c2ea9535e7425807f488692e560
Author: Jens Rehsack <sno@netbsd.org>
Date:   Wed Jan 27 17:43:31 2016 +0100

    path-tiny-perl: Update to 0.076

    Update CPAN hosted Perl5 module Path::Tiny from 0.072 to 0.076.
    Mark resulting packages as allarch.

    Changes since 0.072: =
https://metacpan.org/source/DAGOLDEN/Path-Tiny-0.076/Changes

    Signed-off-by: Jens Rehsack <sno@netbsd.org>

commit cec65e068482d1c68248bfa18978f7d69cf814fe
Author: Jens Rehsack <sno@netbsd.org>
Date:   Wed Jan 27 17:39:28 2016 +0100

    test-mockrandom-perl: add recipe for version 1.01

    Add recipe for CPAN hosted Perl5 module Test::MockRandom by David =
Golden
    to satisfy requirements for update of Path::Tiny recipe.

    Test::MockRandom replaces random number generation with non-random =
number
    generation, primary for reliable regression testing.

    Signed-off-by: Jens Rehsack <sno@netbsd.org>

commit 6b091d47bd14831d875f41d366e327ab127b4a62
Author: Jens Rehsack <sno@netbsd.org>
Date:   Tue Jan 26 23:13:30 2016 +0100

    recipes-devel: clean-up

    Clean up recipes-devel and move some recipes to meanwhile existing =
better categories.

    Signed-off-by: Jens Rehsack <sno@netbsd.org>

commit 71c6b98f1e2140423d057ad0fbdc9ab1158bf25a
Author: Jens Rehsack <sno@netbsd.org>
Date:   Tue Jan 26 18:30:26 2016 +0100

    test-warnings-perl: Update to 0.025

    Update CPAN hosted Perl5 module Test::Warnings from 0.021 to 0.025.
    Mark resulting packages as allarch.

    Changes since 0.021: =
https://metacpan.org/source/ETHER/Test-Warnings-0.025/Changes

    Signed-off-by: Jens Rehsack <sno@netbsd.org>

commit 1c95d9ef0ffca8aabda15bdf90c7c975f0bf4d9f
Author: Jens Rehsack <sno@netbsd.org>
Date:   Tue Jan 26 18:26:33 2016 +0100

    test-sharedfork-perl: Update to 0.35

    Update CPAN hosted Perl5 module Test::SharedFork from 0.33 to 0.35.
    Mark resulting package as allarch.

    Changes since 0.33: =
https://metacpan.org/source/EXODIST/Test-SharedFork-0.35/Changes

    Signed-off-by: Jens Rehsack <sno@netbsd.org>

commit 59e194ef8b983d5fff06c838d325c2982faf06e7
Author: Jens Rehsack <sno@netbsd.org>
Date:   Tue Jan 26 18:22:45 2016 +0100

    test-exception-perl: Update to 0.43

    Update CPAN hosted Perl5 package Test::Exception from 0.40 to 0.43.
    Mark resulting packages as allarch.

    Changes since 0.40: =
https://metacpan.org/source/EXODIST/Test-Exception-0.43/Changes

    Signed-off-by: Jens Rehsack <sno@netbsd.org>

commit d5291d03c20561be77a1b784b3984dd4acb0448e
Author: Jens Rehsack <sno@netbsd.org>
Date:   Tue Jan 26 18:18:16 2016 +0100

    test-mocktime-perl: Update to 0.15

    Update CPAN hosted Perl5 module Test::MockTime from 0.13 to 0.15.
    Mark the resulting packages as allarch.

    Changes since 0.13: =
https://metacpan.org/source/DDICK/Test-MockTime-0.15/Changes

    Signed-off-by: Jens Rehsack <sno@netbsd.org>

commit a3cc045b5d5ed8c48d04825ceea1e90b67097a06
Author: Jens Rehsack <sno@netbsd.org>
Date:   Tue Jan 26 18:14:33 2016 +0100

    test-deep-perl: Update to 1.120

    Update CPAN hosted Perl5 module Test::Deep from 0.117 to 1.120.
    Mark resulting packages as allarch.

    Changes since 0.117: =
https://metacpan.org/source/RJBS/Test-Deep-1.120/Changes

    Signed-off-by: Jens Rehsack <sno@netbsd.org>

commit 4c77efe6f1f1a369d4959636cab2bb5377e7e082
Author: Jens Rehsack <sno@netbsd.org>
Date:   Tue Jan 26 18:07:01 2016 +0100

    perl-tidy-perl: Update to 20150815

    Upate CPAN hosted Perl5 module Perl::Tidy from 20140711 to 20150815.
    Mark resulting packages as allarch.

    Changes since 20140711: =
https://metacpan.org/source/SHANCOCK/Perl-Tidy-20150815/CHANGES

    Signed-off-by: Jens Rehsack <sno@netbsd.org>

commit 8e28e55f47f9149913cb2468e48caa6f79595d38
Author: Jens Rehsack <sno@netbsd.org>
Date:   Tue Jan 26 18:02:28 2016 +0100

    moose-perl: Update to 2.1604

    Update CPAN hosted Perl5 module Moose from 2.1600 to 2.1604.

    Changes since 2.1600: =
https://metacpan.org/source/ETHER/Moose-2.1604/Changes

    Signed-off-by: Jens Rehsack <sno@netbsd.org>

commit 8909c314cac9996107c25b17185d5f9b675b37a7
Author: Jens Rehsack <sno@netbsd.org>
Date:   Tue Jan 26 17:57:52 2016 +0100

    variable-magic-perl: Update to 0.59

    Update CPAN hosted Perl5 package Variable::Magic from 0.58 to 0.59.

    Changes since =
https://metacpan.org/source/VPIT/Variable-Magic-0.59/Changes

    Signed-off-by: Jens Rehsack <sno@netbsd.org>

commit 41fd74eb471ba4d9294dfc45aa72f1c113e2b129
Author: Jens Rehsack <sno@netbsd.org>
Date:   Tue Jan 26 17:51:57 2016 +0100

    try-tiny-perl: Update to 0.24

    Updating CPAN Hosted Perl module Try::Tiny from 0.22 to 0.24.
    Mark resulting packages as allarch.

    Changes since 0.22: =
https://metacpan.org/source/ETHER/Try-Tiny-0.24/Changes

    Signed-off-by: Jens Rehsack <sno@netbsd.org>

commit 0bb5fc38ca179624205675fd4291d84b7191c37d
Author: Jens Rehsack <sno@netbsd.org>
Date:   Tue Jan 26 17:45:11 2016 +0100

    sub-identify-perl: Update to 0.12

    Update CPAN hosted Perl5 module Sub::Identify from 0.10 to 0.12.

    Changes since 0.10: =
https://metacpan.org/source/RGARCIA/Sub-Identify-0.12/Changes

    Signed-off-by: Jens Rehsack <sno@netbsd.org>

commit 773acdf05b1d6c5324a2b2a85c187171095fb9c1
Author: Jens Rehsack <sno@netbsd.org>
Date:   Tue Jan 26 17:36:40 2016 +0100

    struct-dumb-perl: Update to 0.08

    Update CPAN hosted Perl5 module Struct::Dumb from 0.03 to 0.08.
    Mark resulting packages as allarch.

    Changes since 0.03: =
https://metacpan.org/source/PEVANS/Struct-Dumb-0.08/Changes

    Signed-off-by: Jens Rehsack <sno@netbsd.org>

commit 0f800bde144d093685b6eaf1ec0a0d4f71c0db75
Author: Jens Rehsack <sno@netbsd.org>
Date:   Tue Jan 26 17:29:46 2016 +0100

    strictures-perl: Update to 2.000002

    Update CPAN hosted Perl5 pragma strictures from 2.000001 to =
2.000002.
    Mark resulting packages as allarch.

    Changes since 2.000001: =
https://metacpan.org/source/HAARG/strictures-2.000002/Changes

    Signed-off-by: Jens Rehsack <sno@netbsd.org>

commit 72052e69f9af898c91f38c2462fa1c18d367e846
Author: Jens Rehsack <sno@netbsd.org>
Date:   Tue Jan 26 17:26:10 2016 +0100

    scope-upper-perl: Update to 0.28

    Update CPAN hosted Perl5 module Scope::Upper from 0.27 to 0.28.

    Changes since 0.27: =
https://metacpan.org/source/VPIT/Scope-Upper-0.28/Changes

    Signed-off-by: Jens Rehsack <sno@netbsd.org>

commit 9692089a889905d3f39e689deb364817defdfe2b
Author: Jens Rehsack <sno@netbsd.org>
Date:   Tue Jan 26 17:14:44 2016 +0100

    padwalker-perl: Update to 2.2

    Update CPAN hosted Perl5 module PadWalker from 2.1 to 2.2.

    Changes since 2.1: =
https://metacpan.org/source/ROBIN/PadWalker-2.2/Changes

    Signed-off-by: Jens Rehsack <sno@netbsd.org>

commit 93c843bda164e38badcd70b5e0d02067c2a06cde
Author: Jens Rehsack <sno@netbsd.org>
Date:   Tue Jan 26 17:11:56 2016 +0100

    package-deprecationmanager-perl: Update to 0.15

    Update CPAN hosted Perl5 module Package::DeprecationManager from =
0.14 to 0.15.
    Mark resulting packages as allarch.

    Changes since 0.14: =
https://metacpan.org/source/DROLSKY/Package-DeprecationManager-0.15/Change=
s

    Signed-off-by: Jens Rehsack <sno@netbsd.org>

commit 0d17dbc2e3b8a1811db24d9f4f7453d271344593
Author: Jens Rehsack <sno@netbsd.org>
Date:   Tue Jan 26 17:08:31 2016 +0100

    namespace-autoclean-perl: Update to 0.28

    Update CPAN hosted Perl5 module namespace::autoclean from 0.26 to =
0.28.
    Mark resulting packages as allarch.

    Changes since 0.26: =
https://metacpan.org/source/ETHER/namespace-autoclean-0.28/Changes

    Signed-off-by: Jens Rehsack <sno@netbsd.org>

commit 32399bfdb9933b48420a107b89bd1c23e93ed245
Author: Jens Rehsack <sno@netbsd.org>
Date:   Tue Jan 26 17:04:55 2016 +0100

    namespace-clean-perl: Update to 0.26

    Update CPAN hosted Perl5 module namespace::clean from 0.25 to 0.26.
    Mark resulting packages as allarch.

    Changes since 0.25: =
https://metacpan.org/source/RIBASUSHI/namespace-clean-0.26/Changes

    Signed-off-by: Jens Rehsack <sno@netbsd.org>

commit 50b19920a8bc0c444930e171e87274365e99d34b
Author: Jens Rehsack <sno@netbsd.org>
Date:   Tue Jan 26 16:58:01 2016 +0100

    moox-log-any-perl: Update to 0.004004

    Update CPAN hosted Perl5 module MooX::Log::Any from 0.004002 to =
0.004004.
    Mark resulting package as allarch.

    Changes since 0.004002: =
https://metacpan.org/source/CAZADOR/MooX-Log-Any-0.004004/Changes

    Signed-off-by: Jens Rehsack <sno@netbsd.org>

commit 5f392d9df0263e53e34a85ad2b3d8043a06ae4d6
Author: Jens Rehsack <sno@netbsd.org>
Date:   Tue Jan 26 16:53:55 2016 +0100

    mime-types-perl: Update to 2.12

    Update CPAN hosted Perl5 module MIME::Types from 2.11 to 2.12.
    Mark resulting packages as allarch.

    Changes since 2.11: =
https://metacpan.org/source/MARKOV/MIME-Types-2.12/ChangeLog

    Signed-off-by: Jens Rehsack <sno@netbsd.org>

commit 281d514e6e2669c3c8e69d455a7401fe5cd98747
Author: Jens Rehsack <sno@netbsd.org>
Date:   Tue Jan 26 16:50:15 2016 +0100

    log-dispatch-perl: Update to 2.54

    Update CPAN hosted Perl5 module Log::Dispatch from 2.46 to 2.54.
    Mark resulting packages as allarch.

    Move Log::Dispatch::Conflicts to -dev package and move prereq for it
    (Dist::CheckConflicts) to configure depends and -dev's RDEPENDS.

    Changes since 2.46: =
https://metacpan.org/source/DROLSKY/Log-Dispatch-2.54/Changes

    Signed-off-by: Jens Rehsack <sno@netbsd.org>

commit 3431b1ee60feec89a428a4be8686c9d948f578e9
Author: Jens Rehsack <sno@netbsd.org>
Date:   Tue Jan 26 16:32:05 2016 +0100

    io-tiecombine-perl: Update to 1.005

    Update CPAN hosted Perl5 module IO::TieCombine from 1.004 to 1.005.
    Mark resulting package as allarch.

    Changes since 1.004: =
https://metacpan.org/source/RJBS/IO-TieCombine-1.005/Changes

    Signed-off-by: Jens Rehsack <sno@netbsd.org>

commit 5abb1a44dbe21c0689d47f4a40ce7d430c2d79b8
Author: Jens Rehsack <sno@netbsd.org>
Date:   Tue Jan 26 16:29:14 2016 +0100

    import-into-perl: Update to 1.002005

    Update CPAN hosted Perl5 module Import::Into from 1.002004 to =
1.002005.
    Mark resulting packages as allarch.

    Changes since 1.002004: =
https://metacpan.org/source/HAARG/Import-Into-1.002005/Changes

    Signed-off-by: Jens Rehsack <sno@netbsd.org>

commit ed41536d348bb91f2b790836c42f359be1f30fa2
Author: Jens Rehsack <sno@netbsd.org>
Date:   Tue Jan 26 16:25:44 2016 +0100

    getopt-long-perl: Update to 2.48

    Update CPAN hosted Perl5 module Getopt::Long from 2.47 to 2.48.
    Mark resulting packages as allarch.

    Changces since 2.47: =
https://metacpan.org/source/JV/Getopt-Long-2.48/CHANGES

    Signed-off-by: Jens Rehsack <sno@netbsd.org>

commit 7f11cc1c23aa1432b463a9e482e3d91df9198eac
Author: Jens Rehsack <sno@netbsd.org>
Date:   Tue Jan 26 16:20:11 2016 +0100

    extutils-parsexs-perl: Update to 3.30

    Update CPAN hosted Perl5 module ExtUtils::ParseXS from 3.24 to 3.30.
    Mark resulting packages as allarch.

    Changes since 3.24: =
https://metacpan.org/source/SMUELLER/ExtUtils-ParseXS-3.30/Changes

    Signed-off-by: Jens Rehsack <sno@netbsd.org>

commit 7c4bcb1c3bd50584c45a66a470037dae9dfd2748
Author: Jens Rehsack <sno@netbsd.org>
Date:   Tue Jan 26 12:41:40 2016 +0100

    extutils-depends-perl: Update to 0.405

    Update CPAN hosted Perl5 module ExtUtils::Depends from 0.404 to =
0.405.
    Mark resulting package as allarch.

    Changes since 0.404: =
https://metacpan.org/source/XAOC/ExtUtils-Depends-0.405/Changes

    Signed-off-by: Jens Rehsack <sno@netbsd.org>

commit 198f15d60c045dc1f3522cb753bf3410378e4716
Author: Jens Rehsack <sno@netbsd.org>
Date:   Tue Jan 26 12:14:53 2016 +0100

    extutils-cppguess-perl: Update to 0.11

    Update CPAN hosted Perl5 module ExtUtils::CppGuess from 0.09 to =
0.11.
    Mark resulting package as allarch

    Changes since 0.09: =
https://metacpan.org/source/DAVIDO/ExtUtils-CppGuess-0.11/Changes

    Signed-off-by: Jens Rehsack <sno@netbsd.org>

commit 92395f7a5d6931870af147bb28f8c79da4f585d3
Author: Jens Rehsack <sno@netbsd.org>
Date:   Tue Jan 26 11:37:09 2016 +0100

    extutils-makemaker-perl: Update to 7.10

    Update CPAN hosted Perl5 module ExtUtils::MakeMaker from 7.04 to =
7.10.
    Mark the resulting package as allarch.

    Changes since 7.04: =
https://metacpan.org/source/BINGOS/ExtUtils-MakeMaker-7.10/Changes

    Signed-off-by: Jens Rehsack <sno@netbsd.org>

commit b00d8b698f3855bbefa3e5873229767a20ef8fe6
Author: Jens Rehsack <sno@netbsd.org>
Date:   Tue Jan 26 11:29:14 2016 +0100

    experimental-perl: Update to 0.016

    Updating CPAN hosted Perl5 experimental pragma from 0.013 to 0.016.
    Marking resulting package as allarch.

    Changes since 0.013: =
https://metacpan.org/source/LEONT/experimental-0.016/Changes

    Signed-off-by: Jens Rehsack <sno@netbsd.org>

commit e5e5346c53da26d3443bec95421360239c66fe64
Author: Jens Rehsack <sno@netbsd.org>
Date:   Tue Jan 26 11:13:42 2016 +0100

    devel-overloadinfo-perl: Update to 0.004

    Update CPAN hosted Perl5 module Devel::OverloadInfo from 0.002 to =
0.004.

    Changes since 0.002: =
https://metacpan.org/source/ILMARI/Devel-OverloadInfo-0.004/Changes

    Signed-off-by: Jens Rehsack <sno@netbsd.org>

commit d1bf1d679749c516f0d08d8132d84cc010323802
Author: Jens Rehsack <sno@netbsd.org>
Date:   Mon Jan 25 19:53:42 2016 +0100

    extutils-cbuilder-perl: Update to 0.280224

    Update CPAN hosted Perl5 module ExtUtils::CBuilder from 0.280223 to =
0.280224.

    Changes since 0.280223: =
https://metacpan.org/source/AMBS/ExtUtils-CBuilder-0.280224/Changes

    Signed-off-by: Jens Rehsack <sno@netbsd.org>

commit cd1ae042250098ee8b5eb86b83628cd577eb6c19
Author: Jens Rehsack <sno@netbsd.org>
Date:   Mon Jan 25 18:59:52 2016 +0100

    text-diff-perl: move to recipes-textproc

    Text::Diff is more reasonable below recipes-textproc instead of =
overflowing recipes-devel

    Signed-off-by: Jens Rehsack <sno@netbsd.org>

commit f91b387b09f053e8166eb6e0009e765f611fe17f
Author: Jens Rehsack <sno@netbsd.org>
Date:   Mon Jan 25 18:47:36 2016 +0100

    devel-mat-perl: Update to 0.21

    Update CPAN hosted Perl5 package Devel::MAT from 0.20 to 0.21.
    Use cpan_build directly ...

    Changes since 0.20: =
https://metacpan.org/source/PEVANS/Devel-MAT-0.21/Changes

    Signed-off-by: Jens Rehsack <sno@netbsd.org>

commit bd349a4140baf50f8f4faf745d0bc73f757523b8
Author: Jens Rehsack <sno@netbsd.org>
Date:   Mon Jan 25 18:38:51 2016 +0100

    module-build-perl: Update to 0.4216

    Update CPAN hosted Perl5 module Module::Build from 0.4214 to 0.4216.
    Mark resulting package as allarch and add a patch to use right path =
for shebang-fix

    Changes since 0.4214: =
https://metacpan.org/source/LEONT/Module-Build-0.4216/Changes

    Signed-off-by: Jens Rehsack <sno@netbsd.org>

commit 37a933073a86cffed8d34c8e9d4009cdd52f6d0b
Author: Jens Rehsack <sno@netbsd.org>
Date:   Mon Jan 25 17:00:07 2016 +0100

    app-cmd-perl: Update to 0.330

    Update CPAN hosted Perl5 module App::Cmd from 0.327 to 0.330.
    Mark resulting package as allarch.

    Changes since 0.327: =
https://metacpan.org/source/RJBS/App-Cmd-0.330/Changes

    Signed-off-by: Jens Rehsack <sno@netbsd.org>

commit 8b8facaa8922f99a7f3918c4bf11643cae5a16e5
Author: Jens Rehsack <sno@netbsd.org>
Date:   Mon Jan 25 15:16:44 2016 +0100

    io-compress-perl: Update to 2.069

    Update CPAN hosted Perl5 modules IO::Compress::* from 2.068 to =
2.069.

    Changes since 2.068: =
https://metacpan.org/source/PMQS/IO-Compress-2.069/Changes

    Signed-off-by: Jens Rehsack <sno@netbsd.org>

commit 58465a87a6c5d95c1ba9a4139d95db389484e0d4
Author: Jens Rehsack <sno@netbsd.org>
Date:   Mon Jan 25 15:11:59 2016 +0100

    compress-raw-zlib-perl: Update to 2.069

    Update CPAN hosted Perl5 module Compress::Raw::Zlib from 2.068 to =
2.069.
    Remove libz dependency since Compress::Raw::Zlib always builds =
bundled libz.

    Chances since 2.068: =
https://metacpan.org/source/PMQS/Compress-Raw-Zlib-2.069/Changes

    Signed-off-by: Jens Rehsack <sno@netbsd.org>

commit cc91f30e8ce5cb38cfffdf29e1f8ed4852e61f96
Author: Jens Rehsack <sno@netbsd.org>
Date:   Mon Jan 25 14:57:45 2016 +0100

    compress-raw-bzip2-perl: Update to 2.069

    Update CPAN hosted Perl5 module Compress::Raw::Bzip2 from 2.068 to =
2.069.

    Changes since 2.068 - =
https://metacpan.org/source/PMQS/Compress-Raw-Bzip2-2.069/Changes

    Signed-off-by: Jens Rehsack <sno@netbsd.org>

commit 3e939651afaa31e6bdb734c11dfbea0d5faf9871
Author: Jens Rehsack <sno@netbsd.org>
Date:   Tue Nov 24 15:18:37 2015 +0100

    mozilla-ca-perl: Update Perl module Mozilla::CA to 20150826

    Updating mozilla-ca-perl for CPAN hosted Perl module Mozilla::CA =
from 20141217 to 20150826.

    Changes since 20141217:
    20150826
      - Update from Mozilla repository
      - Update license to match license of data source (MPL 2)

    Signed-off-by: Jens Rehsack <sno@netbsd.org>


--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_14084FE6-8B19-42F3-9DD7-A245E42FEB2B
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQIcBAEBCgAGBQJWsl8dAAoJEESZlq7c5QqdJsIP/0ExP3uclsuMjPy7bvW/jPI4
Kz3hmO0aRuYubKXIqsrWE+LvnALgyC9GiHJTjQ81GXljwBLOAm7FsKqyk07CUck4
BCb6LkT9VwuNjRFOz8BVo0Ehnw3y5VqCrBmYcpqo+AZfeUuCu3vKhhJ/7T+lz08+
+e2d698z4MaSjtX9txZpLDis3zbwFza4GT2OBql4Cu/X29H7h1D8phXeE3VP4GW7
DFfdwvbW+lRjQuUugSWz+UF08Bu/7UgmT9WGPAJGy23EqIZqfxi1YJDsd7gUS2OT
vEsJ5+R7z9dQfWNEU6rFffxpv3qBqhJeE3jpJmXOEwMI6KrPw8xDcHtLfDr2qXZK
Z7+ot6YjXi96CgLB7P5J4/monqlihNg7/d4XK04VdhNqH0O84oeZ13kUsYUWPvTQ
3jdMZGfxJOzna+j8Dy9mBkF0HEJvS1oAIVBiSJ77M9QM4sgiL8yjplKlMWdHTyEg
ABGj9c572z+nPtOfo0t6XWxzALsGLTAfPlKq1sbyv2Jl32BJBlKibhXUPPyrF2bH
O5lhfpY5IDv5sxyHaazJ6Z9WNG7I3Gi2KINi3NNfcfNvc4fmM92om7kvBDkFFbxx
Lujgum5Ej8c70jq7zGb73mZlU867+eXrgArMcqRpwW87BDHpvhDmcMmrOLJN2oEb
ASTu0k1bi3ge/HMLENfE
=+2+K
-----END PGP SIGNATURE-----

--Apple-Mail=_14084FE6-8B19-42F3-9DD7-A245E42FEB2B--

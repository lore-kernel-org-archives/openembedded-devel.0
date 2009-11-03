Received: from [209.85.218.217] (helo=mail-bw0-f217.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ricardo.salveti@openbossa.org>) id 1N5N2O-0001Oj-3C
	for openembedded-devel@lists.openembedded.org;
	Tue, 03 Nov 2009 18:19:23 +0100
Received: by bwz9 with SMTP id 9so7731995bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Nov 2009 09:18:08 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.95.72 with SMTP id c8mr34677fan.73.1257268687894; Tue, 03 
	Nov 2009 09:18:07 -0800 (PST)
Date: Tue, 3 Nov 2009 14:18:07 -0300
Message-ID: <ae9c9a1c0911030918x4bc4e947j5691e8681c09e4dc@mail.gmail.com>
From: Ricardo Salveti de Araujo <ricardo.salveti@openbossa.org>
To: mamona-devel@garage.maemo.org, openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.218.217
X-SA-Exim-Mail-From: ricardo.salveti@openbossa.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Mamona current status
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 03 Nov 2009 17:19:23 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi all,

After quite a while working on internal projects at INdT, we finally
got time to work with Mamona again.

Currently Mamona is unmaintained at the OE tree, and our public
repository is quite old, as we created kind of a fork in the past and
the push work became a quite painful job.

To get the distro up and running again, we decided to do something
different by creating an overlay and pushing our custom modifications
there, before actually merging everything into OE.

After the merge, we'll probably start using just OE directly, so we
can avoid facing the same problems we had in the past.

For those who want to follow the work, please check
http://gitorious.org/mamona and
http://dev.openbossa.org/trac/mamona/wiki/MergeOe

And regarding the N900, we'll probably have some news in this direction soon :-)

Cheers,
-- 
Ricardo Salveti de Araujo



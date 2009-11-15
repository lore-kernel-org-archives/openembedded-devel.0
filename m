Received: from [216.168.135.169] (helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1N9ln1-0001IV-5S
	for openembedded-devel@lists.openembedded.org;
	Sun, 15 Nov 2009 21:33:42 +0100
Received: (qmail 23017 invoked by uid 1003); 15 Nov 2009 20:32:14 -0000
Received: from localhost (HELO ?192.168.1.167?) (philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 15 Nov 2009 20:32:14 -0000
Message-ID: <4B00654D.3010507@balister.org>
Date: Sun, 15 Nov 2009 15:32:13 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.4pre) Gecko/20091014 Fedora/3.0-2.8.b4.fc11
	Thunderbird/3.0b4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: New parse error in dev
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
X-List-Received-Date: Sun, 15 Nov 2009 20:33:42 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Commit:

http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=f18414059f60ec5924a702a227069aac09f19a0b

introduces the following parse error:

NOTE: Handling BitBake files: / (3129/7521) [41 %]ERROR: Could not 
inherit file classes/girepository.bbclass while parsing 
/home/balister/oe/openembedded/recipes/shr/libmodulo_git.bb
NOTE: Handling BitBake files: | (7521/7521) [100 %]
NOTE: Parsing finished. 7158 cached, 73 parsed, 289 skipped, 0 masked.
ERROR: Parsing errors found, exiting...

I don't see a quick fix, can someone knowledgeable about shr please fix 
this ASAP.

Philip



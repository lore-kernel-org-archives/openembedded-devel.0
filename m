Received: from [85.13.140.93] (helo=dd20204.kasserver.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Bernhard.Guillon@opensimpad.org>) id 1KY6BH-0006ej-02
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Aug 2008 23:34:27 +0200
Received: from [192.168.1.103] (91-65-161-148-dynip.superkabel.de
	[91.65.161.148])
	by dd20204.kasserver.com (Postfix) with ESMTP id 11074183DA61C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Aug 2008 23:32:59 +0200 (CEST)
Message-ID: <48B47684.5060909@opensimpad.org>
Date: Tue, 26 Aug 2008 23:32:52 +0200
From: Bernhard Guillon <Bernhard.Guillon@opensimpad.org>
User-Agent: Thunderbird 2.0.0.16 (X11/20080724)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: Please have a look at my aufs bb file (oe bug 4524)
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
X-List-Received-Date: Tue, 26 Aug 2008 21:34:27 -0000
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,
I am not used to write .bb files.
I created a .bb file for aufs (another unionfs ) and tested it for 
arm-oabi (SIMpad).
It would help me a lot if you comment on my patch (oe bug 4524) and give 
suggestions or if you like commit it to oe.

best regards
Bernhard Guillon



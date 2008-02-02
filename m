Received: from [212.27.42.30] (helo=smtp4-g19.free.fr)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <gcasse@oralux.org>) id 1JLLAz-00009d-4W
	for openembedded-devel@lists.openembedded.org;
	Sat, 02 Feb 2008 17:25:09 +0100
Received: from smtp4-g19.free.fr (localhost.localdomain [127.0.0.1])
	by smtp4-g19.free.fr (Postfix) with ESMTP id B958B3EA0FB
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  2 Feb 2008 17:25:18 +0100 (CET)
Received: from [192.168.0.10] (bdy93-1-82-67-223-79.fbx.proxad.net
	[82.67.223.79])
	by smtp4-g19.free.fr (Postfix) with ESMTP id 9802B3EA0CC
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  2 Feb 2008 17:25:18 +0100 (CET)
Message-ID: <47A4996E.3010309@oralux.org>
Date: Sat, 02 Feb 2008 17:25:18 +0100
From: Gilles Casse <gcasse@oralux.org>
User-Agent: Thunderbird 2.0.0.6 (X11/20071008)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: Package proposal: Emacspeak
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
X-List-Received-Date: Sat, 02 Feb 2008 16:25:09 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

Could you please welcome Emacspeak in OE?

Emacspeak is a "talking emacs", the audio desktop written by TV Raman:
http://emacspeak.sf.net

It firstly concerns visually impaired users, and could be appreciated by 
sighted users as well for editing long files (I am testing it on the Neo 
with an external keyboard).

The current proposed bitbake recipes are:
* tcltk (#3733)
http://bugs.openembedded.net/show_bug.cgi?id=3733

* emacspeak (#3734)
http://bugs.openembedded.net/show_bug.cgi?id=3734

Thank you!
Gilles




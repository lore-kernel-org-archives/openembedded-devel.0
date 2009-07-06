Received: from [64.22.125.45] (helo=wiki.koala.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koansoftware@gmail.com>) id 1MNisy-00015b-1c
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Jul 2009 09:45:12 +0200
Received: from localhost (localhost [127.0.0.1])
	by wiki.koala.it (Postfix) with ESMTP id D8F9B2C827
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Jul 2009 07:32:21 +0000 (UTC)
Received: from wiki.koala.it ([127.0.0.1])
	by localhost (wiki.koala.it [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n-nwg7bE8tv1
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Jul 2009 07:32:19 +0000 (UTC)
Received: from [151.80.10.35] (unknown [151.80.10.35])
	by wiki.koala.it (Postfix) with ESMTPSA id 374752C81E
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Jul 2009 07:32:17 +0000 (UTC)
Message-ID: <4A51A88D.8020107@gmail.com>
Date: Mon, 06 Jul 2009 09:32:29 +0200
From: Marco Cavallini <koansoftware@gmail.com>
Organization: KOAN sas - Bergamo - Italia
User-Agent: Thunderbird 2.0.0.22 (X11/20090608)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: Xserver file generation
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
X-List-Received-Date: Mon, 06 Jul 2009 07:45:12 -0000
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit

Hi, I need your help to solvea problem with Xserver file generation

Distro:kaeilos
Machine:ronetix-pm9263
Image: x11-image

I am trying to figure out how the /etc/X11/Xserver file is generated,
because when I read such file in the target system I find something that
I haven't defined and that looks neither defined from any of the patches
related to the proper recipe package xserver-common_1.22.bb

At last my questions and doubts are the following:
1. Is it correct to consider xserver-xcommon the recipe responsible for
creating such file?
2. How would be created the Xserver file?
3. WHich patches flow is involved into its creation?


The file I get on the target contains the following :
http://pastebin.com/m42ba5037

TIA
/marco



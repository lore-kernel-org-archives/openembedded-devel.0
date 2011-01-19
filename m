Received: from www.xora.org.uk ([80.68.91.202] helo=xora.vm.bytemark.co.uk)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dp@xora.org.uk>) id 1PfZLZ-00079b-4E
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Jan 2011 15:49:17 +0100
Received: from localhost (localhost [127.0.0.1])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTP id AACA8A479E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jan 2011 14:48:33 +0000 (GMT)
X-Virus-Scanned: Debian amavisd-new at xora.vm.bytemark.co.uk
Received: from xora.vm.bytemark.co.uk ([127.0.0.1])
	by localhost (xora.vm.bytemark.co.uk [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id xxKslQj4oJm5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jan 2011 14:48:32 +0000 (GMT)
Received: from [192.168.1.10] (188-220-34-37.zone11.bethere.co.uk
	[188.220.34.37])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTPSA id 784BFA479A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jan 2011 14:48:32 +0000 (GMT)
Message-ID: <4D36F9BE.1010601@xora.org.uk>
Date: Wed, 19 Jan 2011 14:48:30 +0000
From: Graeme Gregory <dp@xora.org.uk>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-GB;
	rv:1.9.2.13) Gecko/20101207 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 1.1.1
Subject: openembedded-core git repository
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
X-List-Received-Date: Wed, 19 Jan 2011 14:49:17 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi, this email is sent as an ordinary member of OE.

It seems to be on a technical level we are agreed that we should split
parts of OE out into the so called openembedded-core which will have a
stricter commit access and higher QA requirements on changes.

I therefore think it is time to actually create the repository and let
the people who are interested in merging the good stuff from poky with
the good stuff from openembedded to create our "core". I don't think
there is any need to wait on the political part of the Yocto/OE
collaboration as its something we have agreed in principal to do anyway.

I would request then that the TSC drive this forward with the server
admins and create this repo so work can happen.

Graeme




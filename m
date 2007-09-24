Received: from [62.70.27.18] (helo=esparsett.troll.no)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <lpotter@trolltech.com>) id 1IZt3N-0000cb-Az
	for openembedded-devel@openembedded.org; Mon, 24 Sep 2007 20:53:09 +0200
Received: from esparsett.troll.no (localhost [127.0.0.1])
	by localhost (Postfix) with SMTP
	id E59B47427D; Mon, 24 Sep 2007 20:48:48 +0200 (CEST)
Received: from mail.trolltech.com.au (unknown [10.1.1.12])
	by esparsett.troll.no (Postfix) with ESMTP
	id 0D0C674277; Mon, 24 Sep 2007 20:48:48 +0200 (CEST)
Received: from [172.18.1.4] (unknown [172.18.1.4])
	by mail.trolltech.com.au (Postfix) with ESMTP id 1865836577B;
	Tue, 25 Sep 2007 04:48:43 +1000 (EST)
Message-ID: <46F80688.2020702@trolltech.com>
Date: Tue, 25 Sep 2007 04:48:40 +1000
From: Lorn Potter <lpotter@trolltech.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.8.1.2) Gecko/20070221 SeaMonkey/1.1.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <46F587F7.4060501@balister.org>
In-Reply-To: <46F587F7.4060501@balister.org>
Cc: openembedded-devel@openembedded.org
Subject: Re: How should OE be used?
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
X-List-Received-Date: Mon, 24 Sep 2007 18:53:10 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I have always thought that oe needed an easier way to choose packages, 
like buildroot.

Some gui that can edit all the conf's and task's, and image.bb's 
painlessly and easily would make a tom of difference.
The learning curve for oe is too high.

Take buildroot, for example. A person can download it, run make 
menuconfig, set up the system, arch, and select packages, all in one go. 
You do not need to know that you should have to either edit or create 
your own tasks, or image .bb's, much less the syntax for those files.



-- 
Lorn 'ljp' Potter
Software Engineer, Systems Group, MES, Trolltech



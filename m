Received: from [64.22.125.45] (helo=wiki.koala.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koansoftware@gmail.com>) id 1MO9WO-00053b-Ls
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Jul 2009 14:11:40 +0200
Received: from localhost (localhost [127.0.0.1])
	by wiki.koala.it (Postfix) with ESMTP id B5E802C827
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Jul 2009 11:58:40 +0000 (UTC)
Received: from wiki.koala.it ([127.0.0.1])
	by localhost (wiki.koala.it [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VcKn7YI0+u8M
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Jul 2009 11:58:38 +0000 (UTC)
Received: from [192.168.0.5] (host56-7-static.30-87-b.business.telecomitalia.it
	[87.30.7.56]) by wiki.koala.it (Postfix) with ESMTPSA id 25B302C81E
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Jul 2009 11:58:37 +0000 (UTC)
Message-ID: <4A5338B3.4010108@gmail.com>
Date: Tue, 07 Jul 2009 13:59:47 +0200
From: Marco Cavallini <koansoftware@gmail.com>
Organization: Marco Cavallini - Bergamo - Italia
User-Agent: Thunderbird 2.0.0.22 (X11/20090608)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4A51A88D.8020107@gmail.com>
	<1246866823.16040.102.camel@lenovo.internal.reciva.com>
In-Reply-To: <1246866823.16040.102.camel@lenovo.internal.reciva.com>
Subject: Re: Xserver file generation
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
X-List-Received-Date: Tue, 07 Jul 2009 12:11:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Phil Blundell ha scritto:
> On Mon, 2009-07-06 at 09:32 +0200, Marco Cavallini wrote:
>> At last my questions and doubts are the following:
>> 1. Is it correct to consider xserver-xcommon the recipe responsible for
>> creating such file?
>> 2. How would be created the Xserver file?
>> 3. WHich patches flow is involved into its creation?
>>
>>
>> The file I get on the target contains the following :
>> http://pastebin.com/m42ba5037
> 
> That file does look like the one from xserver-common.  (There's also a
> competing version of Xserver in xserver-kdrive-common; I don't think
> this is what you have, but "opkg search" would tell you for sure.)
> 
> I'm not quite sure I understand your questions 2 and 3.  Xserver is just
> copied from the source directory into the output package; it isn't
> really "created" inside OE.  As for the patches, I don't know offhand
> which ones are applied but again, there is nothing special about the
> Xserver file; OE will use the same rules as for everything else.
> 
> What's the actual problem that you're trying to solve here?

I need to add a row with my customized configuration


/marco



Received: from [72.14.220.152] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1J4QkI-000496-T2
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Dec 2007 01:55:42 +0100
Received: by fg-out-1718.google.com with SMTP id 22so298637fge.20
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Dec 2007 16:50:51 -0800 (PST)
Received: by 10.86.58.3 with SMTP id g3mr7037992fga.38.1197939051511;
	Mon, 17 Dec 2007 16:50:51 -0800 (PST)
Received: from ?192.168.20.166? ( [194.79.8.34])
	by mx.google.com with ESMTPS id 28sm9890821fkx.2007.12.17.16.50.49
	(version=SSLv3 cipher=OTHER); Mon, 17 Dec 2007 16:50:50 -0800 (PST)
Date: Tue, 18 Dec 2007 02:56:12 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) Professional
X-Priority: 3 (Normal)
Message-ID: <165511774.20071218025612@gmail.com>
To: Rod Whitby <rod@whitby.id.au>, openembedded-devel@lists.openembedded.org
In-Reply-To: <1672988162.20071218025052@gmail.com>
References: <47671326.3090300@whitby.id.au>
	<1672988162.20071218025052@gmail.com>
MIME-Version: 1.0
Subject: Re: pfalcon: revert r5dc6982e... vfat nls modules are not for task-base-kernel26
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
X-List-Received-Date: Tue, 18 Dec 2007 00:55:43 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Paul,

Tuesday, December 18, 2007, 2:50:52 AM, you wrote:

[]

>> And the comment about "# If you don't need VFAT support - don't enable
>> them in defconfig." is not applicable, because there are machines that
>> want vfat-related nls modules available in the feed as a downloadable
>> package, but not in the initial rootfs.  Therefore they need to be in
>> the defconfig, but certainly should not be in task-base-kernel26.

>   Again, lots of things need to be, etc. But for now (as is), my doing it
> right won't help any machine except some small nslu2. Because vfat of
> course will be a distro feature,

  Ah no, it would be combined feature. Worse then, as it opens pandora
box of updating all machine configs with it...

[]


-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com




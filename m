Received: from mail2.multitech.net ([65.126.90.254] helo=mail2.multitech.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jgilles@multitech.com>) id 1QpSFx-0001km-6D
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Aug 2011 23:48:37 +0200
Received: from mail2.multitech.com (localhost.localdomain [127.0.0.1])
	by localhost (Email Security Appliance) with SMTP id
	0410B5AF739_E3C642CB for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Aug 2011 21:44:12 +0000 (GMT)
Received: from mail.multitech.com (unknown [192.168.11.244])
	by mail2.multitech.com (Sophos Email Appliance) with ESMTP id
	DBA0E5AF728_E3C642BF for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Aug 2011 21:44:11 +0000 (GMT)
X-Ninja-PIM: Scanned by Ninja
X-Ninja-AttachmentFiltering: (no action)
Received: from [192.168.52.113] ([192.168.52.113]) by mail.multitech.com with
	Microsoft SMTPSVC(5.0.2195.7381); Fri, 5 Aug 2011 16:43:35 -0500
From: Jesse Gilles <jgilles@multitech.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <CAFu+nvGDUbec-_BVft9-K+Uko95U9CYftk47TWPKh1BA=w7P3g@mail.gmail.com>
References: <CAFu+nvEwf_hPbB0a21qJFWAHZqdCkb3MPaKaZcLFgD+xc7cGVw@mail.gmail.com>
	<4E15F6DD.2020308@mentor.com> <1312553761.14079.22.camel@jjg-linux>
	<CAFu+nvE3v+VswNB-3ZwF3dFMa42wgeSv6GMBJ4C=bYNpWKKFmw@mail.gmail.com>
	<20110805151726.GB15632@rhein.zuhause.netz>
	<CAFu+nvEwGYd-t6n04yn41wd50+5zPoEu=5WVYxOmaWLDdyKdEQ@mail.gmail.com>
	<1312577070.14079.26.camel@jjg-linux>
	<CAFu+nvGDUbec-_BVft9-K+Uko95U9CYftk47TWPKh1BA=w7P3g@mail.gmail.com>
Date: Fri, 05 Aug 2011 16:44:10 -0500
Message-ID: <1312580650.14079.27.camel@jjg-linux>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-OriginalArrivalTime: 05 Aug 2011 21:43:35.0300 (UTC)
	FILETIME=[BA626440:01CC53B8]
Subject: Re: classpath in 2011.03-maintenance
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
X-List-Received-Date: Fri, 05 Aug 2011 21:48:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-08-05 at 17:24 -0400, George C. Huntington, III wrote:
> the -bootclasspath ''
> part where it uses the single quotes next to eack other, if you
> replace that
> with ::
> two colons it will magically work
> I think for some reason it doesn't like '' for an empty path but two
> path separators back to back ::
> will work great.

Yes, I had just figured out the same thing :)




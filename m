Received: from [66.249.92.169] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <hvontres@gmail.com>) id 1HA7rs-000725-8o
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Jan 2007 17:54:32 +0100
Received: by ug-out-1314.google.com with SMTP id e2so464139ugf
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Jan 2007 08:54:31 -0800 (PST)
Received: by 10.82.135.13 with SMTP id i13mr1256825bud.1169744070895;
	Thu, 25 Jan 2007 08:54:30 -0800 (PST)
Received: by 10.82.185.2 with HTTP; Thu, 25 Jan 2007 08:54:30 -0800 (PST)
Message-ID: <a7f8874a0701250854w63d46b5fmf97c552bd4d1a8ef@mail.gmail.com>
Date: Thu, 25 Jan 2007 08:54:30 -0800
From: "Hans Henry von Tresckow" <hvontres@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <45B820C1.1090100@whitby.id.au>
MIME-Version: 1.0
References: <45B40165.6000506@whitby.id.au>
	<45B4EDCD.1060609@dominion.kabel.utwente.nl>
	<45B50D16.8060001@whitby.id.au>
	<45B518A5.8000500@dominion.kabel.utwente.nl>
	<45B5528F.3050108@whitby.id.au> <45B59FD0.1000207@whitby.id.au>
	<45B6609B.5080909@linuxdevelopment.de> <45B66852.6020801@whitby.id.au>
	<45B820C1.1090100@whitby.id.au>
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
Subject: Re: RFC: customisable pivot-root functionality
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
X-List-Received-Date: Thu, 25 Jan 2007 16:54:32 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

>
> 1) Is there similar functionality elsewhere in OE that I haven't seen,
> and could just use as-is?
>
>
> Have you looked at altboot? it uses custom init-scripts and can be
configured to do the kind of things you were looking at. Originally it was
written to allow Zaurus machines to boot from loop-images on SD or even over
NFS. I have it set up to boot a kenel and rootfs on my SD card.


I hope this helps,

Henry


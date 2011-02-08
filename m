Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jay@jay-tech.ru>) id 1Pmtud-0004OT-RZ
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Feb 2011 21:11:47 +0100
Received: by qyk8 with SMTP id 8so732789qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Feb 2011 12:10:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.220.199.11 with SMTP id eq11mr199588vcb.18.1297195844584; Tue,
	08 Feb 2011 12:10:44 -0800 (PST)
Sender: jay@jay-tech.ru
Received: by 10.220.193.9 with HTTP; Tue, 8 Feb 2011 12:10:44 -0800 (PST)
X-Originating-IP: [95.29.105.217]
In-Reply-To: <4D51566B.9060603@mentor.com>
References: <4D51566B.9060603@mentor.com>
Date: Tue, 8 Feb 2011 23:10:44 +0300
X-Google-Sender-Auth: NR3WgUPdLpcrTPXhv6yYSg31TEU
Message-ID: <AANLkTi=A2Z6Wdk7eQ7w6fG52Waw1MNKkrpT4F9BQGXJ3@mail.gmail.com>
From: Yury Bushmelev <jay4mail@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: OpenEmbedded 2011.3 Release: Request for targets!
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
X-List-Received-Date: Tue, 08 Feb 2011 20:11:48 -0000
Content-Type: text/plain; charset=ISO-8859-1

2011/2/8 Tom Rini <tom_rini@mentor.com>:
> Hey all,
>
> As March is fast approaching I want to gather the list of DISTRO / MACHINE /
> BBPKGS targets that the various distributions would like to see at least
> compile tested (volunteers for HW testing welcome!). Today, I have the
> following setup to be built:

I'll building (clean and incremental)

DISTROs
angstrom-2008.1/angstrom-2010.x/minimal

MACHINEs
collie/akita/tosa/efikamx/ben-nanonote

images
console-image/x11-image/opie-image

Qemu machines may be added here as well..
And may be I'll add jlime..

-- 
Yury Bushmelev



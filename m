Received: from smtp3.nedap.com ([87.249.123.12] helo=smtp.nedap.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jaap.dejong@nedap.com>) id 1Pmp7t-0002xa-1Y
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Feb 2011 16:05:09 +0100
Received: from nvs0066.nedap.local ([10.91.8.1]) by smtp.nedap.com with
	Microsoft SMTPSVC(6.0.3790.1830); Tue, 8 Feb 2011 16:02:58 +0100
X-TM-IMSS-Message-ID: <0c8e2d1a00007049@nedap.com>
Received: from [10.2.40.10] ([10.2.40.10]) by nedap.com ([10.91.8.1]) with
	ESMTP (TREND IMSS SMTP Service 7.0) id 0c8e2d1a00007049 ;
	Tue, 8 Feb 2011 16:02:58 +0100
Message-ID: <4D515B22.5090600@nedap.com>
Date: Tue, 08 Feb 2011 16:02:58 +0100
From: Jaap de Jong <jaap.dejong@nedap.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <4D51566B.9060603@mentor.com>
In-Reply-To: <4D51566B.9060603@mentor.com>
X-OriginalArrivalTime: 08 Feb 2011 15:02:58.0859 (UTC)
	FILETIME=[46050FB0:01CBC7A1]
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
X-List-Received-Date: Tue, 08 Feb 2011 15:05:09 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Please add
     at91sam9263ek
(angstrom-2008.1 / angstrom-2010.x)

On 02/08/2011 03:42 PM, Tom Rini wrote:
> Hey all,
>
> As March is fast approaching I want to gather the list of DISTRO /
> MACHINE / BBPKGS targets that the various distributions would like to
> see at least compile tested (volunteers for HW testing welcome!).
> Today, I have the following setup to be built:
>
> minimal / minimal-uclibc:
> qemux86/ppc/arm/mips/mips64/sh4/mipsel, mpc8315e-rdb, p2020ds, p2020rdb
> +
> nas-server-image/native-sdk-image/console-image/minimal-image/x11-image/meta-toolchain/qt4-x11-demo-image/qt4e-demo-image
>
> angstrom-2008.1 / angstrom-2010.x:
> hawkboard, mini2440, mini6410, beagleboard + console-image /
> qt4-x11-demo-image / qt4e-demo-image
>
> slugos / ucslug:
> nslu2be/le + slugos-image
>
> I'm building all of these for 32bit Ubuntu 8.04, RHEL5 and will be
> adding Ubuntu 10.04 for the next run.  What more do people want added?
> I'm looking to fill this matrix out to something that runs "over the
> weekend" and I've still got plenty of room to spare (which is why I've
> bcc'd everyone in the MAINTAINERS file with a Distro by their name).
>
> And of course if you wish to handle building what you care about
> yourself instead, that's great!  Please just take this as a gentle
> reminder that there's a release coming up so it's time to crank the
> builders up and make sure your stuff is working.
>



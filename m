Received: from [80.67.172.39] (helo=webmail.no-log.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1LdBau-0000Lj-W7
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Feb 2009 23:54:13 +0100
Received: by webmail.no-log.org (Postfix, from userid 33)
	id 5C3564BE7A; Fri, 27 Feb 2009 23:50:42 +0100 (CET)
X-Squirrel-UserHash: c3wyGAAN
X-Squirrel-FromHash: AFRVDw5RXnw=
Message-ID: <39983.AFRVDw5RXnw=.1235775042.squirrel@webmail.no-log.org>
In-Reply-To: <go9m74$k03$1@ger.gmane.org>
References: <43954.AFRVDw5RXnw=.1235749389.squirrel@webmail.no-log.org>
	<go9m74$k03$1@ger.gmane.org>
Date: Fri, 27 Feb 2009 23:50:42 +0100 (CET)
From: "GNUtoo" <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
User-Agent: SquirrelMail/1.4.9a
MIME-Version: 1.0
X-Priority: 3 (Normal)
Importance: Normal
Subject: Re: [patch](or sort of): emacs didn't compile[second part: qemu recipe]
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
X-List-Received-Date: Fri, 27 Feb 2009 22:54:13 -0000
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

> On 27-02-09 16:43, GNUtoo wrote:
>
>> +EXTRA_OECONF +=3D "--target-list=3Darm-linux-user"
>
> NACK, OE handles more than ARM
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
yes I know...the qemu recipe is very problematic...that's why I asked wha=
t
to do
I'd like to integrate the necessary arm patches that permit the build of
emacs...but I don't know which ones of the patches I should integrate...
Denis.




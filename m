Received: from vms173005pub.verizon.net ([206.46.173.5])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <openembedded@rkmorris.us>) id 1Pat3e-0002DV-9B
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 Jan 2011 17:51:26 +0100
Received: from server ([unknown] [71.164.183.134]) by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LEM005SI1GAU970@vms173005.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	06 Jan 2011 10:50:42 -0600 (CST)
Received: from server (127.0.0.1) by server (Axigen)
	with ESMTPSA id 1918E0; Thu, 06 Jan 2011 10:50:31 -0600
Received: from [192.168.1.12] by rkmorris.us with HTTP; Thu,
	06 Jan 2011 10:50:28 -0600
From: Russell Morris <openembedded@rkmorris.us>
Date: Thu, 06 Jan 2011 10:50:28 -0600
X-Mailer: Axigen WebMail
To: Vasily Khoruzhick <anarsoul@gmail.com>
Message-id: <1294332628528842500@rkmorris.us>
In-reply-to: <201101061832.25160.anarsoul@gmail.com>
References: <1294253374472299500@rkmorris.us>
	<201101061721.30643.anarsoul@gmail.com>
	<1294330448552193500@rkmorris.us>
	<201101061832.25160.anarsoul@gmail.com>
Importance: Normal
MIME-version: 1.0
X-AxigenVirus-Level: 1
X-AxigenSpam-Level: 5
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: H1940 Boot Issues -> Executable Build Problems?
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
X-List-Received-Date: Thu, 06 Jan 2011 16:51:26 -0000
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi,

=20

Well, let me try this. The only real difference that I see is the distro -=
 agreed? I'll give that a shot though!

=20

The kernel I used is from OE (targeting the h1940).=20

=20

Thanks,

... Russell

=20

=20

PS: Sorry, not sure what the mailer is doing ... :-(.


On Thu, Jan 6, 2011 10:32  AM, Vasily Khoruzhick <anarsoul@gmail.com> wrot=
e:


>=20
On Thursday 06 January 2011 18:14:08 Russell Morris wrote:
> > Hi Vasily,
> >=20
> > Absolutely! I'm very glad to hear that you have it working on an h1940=
. I
> > think I'm likely the problem ... :-(.
> >=20
> > The file is attached. Do you have any suggestions? If you don't mind, =
could
> > you share your local.conf file for me to try also?
> >=20
> > Thanks!!!
>=20
> Here it is, however it's not for minimal distro, and machine is rx1950 (=
seems=20
> I lost one for rx1950, but I'm sure that it differs only in machine name=
)
>=20
> What kernel do you use on your h1940? One built via OE?
>=20
> Regards
> Vasily
>=20
> P.S. Your mailer inserts too much empty lines in message, could you fix =
it=20
> somehow please? :)
>
From anarsoul@gmail.com Thu Jan 06 19:42:03 2011
Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anarsoul@gmail.com>) id 1Paumh-0006Xm-1J
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 Jan 2011 19:42:03 +0100
Received: by eya28 with SMTP id 28so7301262eya.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Jan 2011 10:41:38 -0800 (PST)
DKIM-Signature: v

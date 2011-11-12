Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <david.thomas@microbee-systems.com>)
	id 1RPFVU-0008Vh-NH for openembedded-devel@lists.openembedded.org;
	Sat, 12 Nov 2011 16:28:36 +0100
Received: by ggnh4 with SMTP id h4so1176044ggn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Nov 2011 07:22:17 -0800 (PST)
Received: by 10.236.115.40 with SMTP id d28mr3690039yhh.37.1321111336540;
	Sat, 12 Nov 2011 07:22:16 -0800 (PST)
Received: from [192.168.0.225] ([24.214.175.85])
	by mx.google.com with ESMTPS id d2sm20078322anm.6.2011.11.12.07.22.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 12 Nov 2011 07:22:15 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: David Thomas <david.thomas@microbee-systems.com>
In-Reply-To: <2222512.tIAhHCihnJ@helios>
Date: Sat, 12 Nov 2011 09:22:12 -0600
Message-Id: <09B58F24-AD81-46C9-86CA-C92284C7BBC4@microbee-systems.com>
References: <CALJpqJwD0FPCUiD1FRCKR4e=ZTRJb-Lko1nBAC-gLPp057EKpg@mail.gmail.com>
	<2307753.9BlijQWh4O@helios>
	<CALJpqJw6MvmkxxDhJ_amJRFep3yYoTjRogPD4GQ1HG2RpQmvQQ@mail.gmail.com>
	<2222512.tIAhHCihnJ@helios>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.1251.1)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: SRC_URI = "svn://svn.o-hand.com/repos/matchbox/trunk
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
X-List-Received-Date: Sat, 12 Nov 2011 15:28:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

I got the Angstrom scripts working with a cm-t35.conf file I found on =
the net. While it remains to bee seen if it runs and functions the same =
as the current Compulab build it is a big step forward. I am going to do =
a writeup to Compulab to change their Wiki as it was a painful dead end =
path... Wish I had tried this approach sooner but I had reservations =
about the CM-T35 having hardware specific differences...

If this works as I now surmize it is a pretty interesting way to build =
kernels for a number of platforms. =20

Thanks for everything

Dave

On Nov 11, 2011, at 11:28 AM, Paul Eggleton wrote:

> On Friday 11 November 2011 11:06:29 you wrote:
>> Dumb question. Can you point me to this distro with cm-t35 machines
>> such that I can get clone? I looked at the Angstrom site.
>=20
> Well, the Angstrom-prescribed method is to use the setup scripts - =
it's=20
> documented in the "Developers" section of the website. You don't have =
to use=20
> this method however - just switch over to the master / =
2011.3-maintenance=20
> branch of OE and you should be able to run your build.
>=20
>> If I have Angstrom build me a kernel does it provide me with the
>> local.conf, etc?=20
>=20
> If you use the scripts it does, yes. Otherwise you should be able to =
keep your=20
> current configuration.
>=20
> Cheers,
> Paul
>=20
> --=20
>=20
> Paul Eggleton
> Intel Open Source Technology Centre




Received: from [66.249.92.175] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <andrew.paulsen@gmail.com>) id 1Gl9Ur-0005Nd-Sv
	for openembedded-devel@lists.openembedded.org;
	Fri, 17 Nov 2006 20:35:33 +0100
Received: by ug-out-1314.google.com with SMTP id e2so696031ugf
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Nov 2006 11:33:09 -0800 (PST)
Received: by 10.78.128.15 with SMTP id a15mr2273417hud.1163791989389;
	Fri, 17 Nov 2006 11:33:09 -0800 (PST)
Received: by 10.78.159.2 with HTTP; Fri, 17 Nov 2006 11:33:09 -0800 (PST)
Message-ID: <d46153c40611171133g68e02b77u5e812a30a8807513@mail.gmail.com>
Date: Fri, 17 Nov 2006 13:33:09 -0600
From: "Andrew Paulsen" <andrew.paulsen@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <455DF8E8.4060801@dominion.kabel.utwente.nl>
MIME-Version: 1.0
References: <d46153c40611170647m2be6b5f6jd7cbe86ccdfc5dc@mail.gmail.com>
	<41e5b4c20611170737p4b1138c0m8798ea67e67d449@mail.gmail.com>
	<d46153c40611170917k1dd90d89ob384306caeada009@mail.gmail.com>
	<74d0deb30611170944j7b93a8ecm3b2b036111a0b6dd@mail.gmail.com>
	<d46153c40611170953g28ddc98dp91bcd1944f171ede@mail.gmail.com>
	<455DF8E8.4060801@dominion.kabel.utwente.nl>
Subject: Re: Problem building dbus-glib-0.72
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
X-List-Received-Date: Fri, 17 Nov 2006 19:35:34 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 11/17/06, Koen Kooi <koen@dominion.kabel.utwente.nl> wrote:
> Familiar is unmaintained in OE, so your error messages don't surprise us.
>
> You could try
>
> DISTRO=angstrom-2007.1
> DISTRO=celinux-test
> DISTRO=generic
> DISTRO=openzaurus-unstable
>
> To get a distro that regularly checked for problems.

Ok, I've got angstrom-2007.1 building right now.  I tried Familiar
first since it was the example in local.conf.sample - maybe that
should be changed to something that is maintained if you're not
surprised that it doesn't work.



Received: from [66.249.92.168] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <andrew.paulsen@gmail.com>) id 1Gl7w1-0002js-Mb
	for openembedded-devel@lists.openembedded.org;
	Fri, 17 Nov 2006 18:55:29 +0100
Received: by ug-out-1314.google.com with SMTP id e2so672721ugf
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Nov 2006 09:53:06 -0800 (PST)
Received: by 10.78.117.10 with SMTP id p10mr2151837huc.1163785985939;
	Fri, 17 Nov 2006 09:53:05 -0800 (PST)
Received: by 10.78.159.2 with HTTP; Fri, 17 Nov 2006 09:53:05 -0800 (PST)
Message-ID: <d46153c40611170953g28ddc98dp91bcd1944f171ede@mail.gmail.com>
Date: Fri, 17 Nov 2006 11:53:05 -0600
From: "Andrew Paulsen" <andrew.paulsen@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <74d0deb30611170944j7b93a8ecm3b2b036111a0b6dd@mail.gmail.com>
MIME-Version: 1.0
References: <d46153c40611170647m2be6b5f6jd7cbe86ccdfc5dc@mail.gmail.com>
	<41e5b4c20611170737p4b1138c0m8798ea67e67d449@mail.gmail.com>
	<d46153c40611170917k1dd90d89ob384306caeada009@mail.gmail.com>
	<74d0deb30611170944j7b93a8ecm3b2b036111a0b6dd@mail.gmail.com>
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
X-List-Received-Date: Fri, 17 Nov 2006 17:55:30 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

> I think dbus-glib 0.72 needs dbus >= 0.94.
> The dbus-1.0 in the include path only denotes the protocol version.
>
> regards
> Philipp

Ok, I'll rephrase my question then.  How do I change the package
versions that are being built?

Again, my local.conf contains:
MACHINE = "compulab-pxa270"
DISTRO = "familiar-unstable"

and I'm trying to "bitbake gpe-image"



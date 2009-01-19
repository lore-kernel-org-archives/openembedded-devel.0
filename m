Received: from [212.27.42.91] (helo=wmproxy1-g27.free.fr)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <alain2210@free.fr>) id 1LP2P2-0002da-Ch
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Jan 2009 23:15:40 +0100
Received: from UNKNOWN (imp8-g19.priv.proxad.net [172.20.243.138])
	by wmproxy1-g27.free.fr (Postfix) with ESMTP id E1EA65E65C;
	Tue, 20 Jan 2009 00:13:40 +0100 (CET)
Received: by UNKNOWN (Postfix, from userid 0)
	id 45DCDFFE6897; Mon, 19 Jan 2009 23:08:30 +0100 (CET)
Received: from  ([82.123.133.183]) by imp.free.fr (IMP) with HTTP 
	for <alain2210@172.20.243.55>; Mon, 19 Jan 2009 23:08:30 +0100
Message-ID: <1232402910.4974f9de405c2@imp.free.fr>
Date: Mon, 19 Jan 2009 23:08:30 +0100
From: Alain2210 <alain2210@free.fr>
To: openembedded-devel@lists.openembedded.org, Alain2210 <alain2210@free.fr>
References: <1232393997.4974d70deeb97@imp.free.fr>
In-Reply-To: <1232393997.4974d70deeb97@imp.free.fr>
MIME-Version: 1.0
User-Agent: Internet Messaging Program (IMP) 3.2.8
X-Originating-IP: 82.123.133.183
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: problems with building
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
X-List-Received-Date: Mon, 19 Jan 2009 22:15:54 -0000
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable

Hello,

I answer to myself for the second point

> 2) I have a problem when fetching with git for exemple for dbus-hlid_gi=
t.bb
> or libgdbus_git.bb, I get :
> git pull --tags git://git.freesmartphone.org/dbus-hlid.git failed with =
signal
> 1,
> output:
>
> and above
>
> Fetching tags only, you probably meant:
>   git fetch --tags
>
> I have tried by hand, git pull --tags does not work but git fetch --tag=
s
> does.
>

I have found the answer on the beagleboard list with google.

So I have modified bitbake 1.8.10 on my computer to get git fetch in plac=
e of
git pull.

Sincerely,

Alain



Received: from [209.85.132.241] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <bernardo@bandos.net>) id 1HchdK-0008EF-Nc
	for openembedded-devel@lists.openembedded.org;
	Sat, 14 Apr 2007 14:45:38 +0200
Received: by an-out-0708.google.com with SMTP id c5so1166438anc
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Apr 2007 05:45:37 -0700 (PDT)
Received: by 10.64.3.9 with SMTP id 9mr1216188qbc.1176554737487;
	Sat, 14 Apr 2007 05:45:37 -0700 (PDT)
Received: by 10.64.3.17 with HTTP; Sat, 14 Apr 2007 05:45:37 -0700 (PDT)
Message-ID: <3ef3a7ad0704140545j18e0ce1aib8a707966b74f313@mail.gmail.com>
Date: Sat, 14 Apr 2007 13:45:37 +0100
From: "=?ISO-8859-1?Q?Jos=E9_Bernardo_Bandos_Rodrigues?=" <bernardo@bandos.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <8A93ACC2-066E-41CE-AAD7-B869EF79B8F5@selfish.org>
MIME-Version: 1.0
References: <8A93ACC2-066E-41CE-AAD7-B869EF79B8F5@selfish.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
Subject: Re: [RFC] Removal of GPL recipes
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
X-List-Received-Date: Sat, 14 Apr 2007 12:45:39 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

I'm not sure I get this one - you're proposing to remove those recipes
because they are GPL licensed?

2007/4/13, Holger Freyther <zecke@selfish.org>:
>
> Hey,
>
> I'm schocked that the following recipes are not compatible to our
> licensing policy and I would like to remove/relicense/rewrite them ASAP.
>
>
> ../org.openembedded.dev/packages/altboot/altboot_1.0.5.bb:4:#
> License: GPL (see http://www.gnu.org/licenses/gpl.txt for a copy of
> the license)
> ../org.openembedded.dev/packages/altboot/altboot_1.0.8.bb:4:#
> License: GPL (see http://www.gnu.org/licenses/gpl.txt for a copy of
> the license)
> ../org.openembedded.dev/packages/altboot/altboot_1.1.1
> +wip-20061123.bb:4:# License: GPL (see http://www.gnu.org/licenses/
> gpl.txt for a copy of the license)
> ../org.openembedded.dev/packages/altboot/altboot_svn.bb:4:# License:
> GPL (see http://www.gnu.org/licenses/gpl.txt for a copy of the license)
> ../org.openembedded.dev/packages/altboot/altboot_1.1.1+wip-SVNR30.bb:
> 4:# License: GPL (see http://www.gnu.org/licenses/gpl.txt for a copy
> of the license))
> ../org.openembedded.dev/packages/images/essential-image.bb:3:#
> License: GPL (see http://www.gnu.org/licenses/gpl.txt for a copy of
> the license)
> ../org.openembedded.dev/packages/images/essential-machine-image.bb:
> 3:# License: GPL (see http://www.gnu.org/licenses/gpl.txt for a copy
> of the license)
> ../org.openembedded.dev/packages/mplayer/mplayer-common.bb:3:#
> License: GPL (see http://www.gnu.org/licenses/gpl.txt for a copy of
> the license)
>
> I will remove them by monday if no one complains.
>
>         z.
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


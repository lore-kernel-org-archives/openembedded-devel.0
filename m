Received: from [64.233.162.235] (helo=nz-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <cliff.brake@gmail.com>) id 1IgK9A-0001DJ-Vd
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Oct 2007 15:01:48 +0200
Received: by nz-out-0506.google.com with SMTP id i11so649843nzh
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Oct 2007 05:55:38 -0700 (PDT)
Received: by 10.114.156.1 with SMTP id d1mr3472578wae.1192193737908;
	Fri, 12 Oct 2007 05:55:37 -0700 (PDT)
Received: by 10.114.191.17 with HTTP; Fri, 12 Oct 2007 05:55:37 -0700 (PDT)
Message-ID: <f96d234e0710120555o141d516cn2bf8ae6c1450ce26@mail.gmail.com>
Date: Fri, 12 Oct 2007 08:55:37 -0400
From: "Cliff Brake" <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <470F12A7.1050200@gmx.net>
MIME-Version: 1.0
References: <470F12A7.1050200@gmx.net>
Cc: theBohemian@gmx.net
Subject: Re: patch: fix patch num in glibc 2.3.3+cvs20050221
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
X-List-Received-Date: Fri, 12 Oct 2007 13:01:55 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 10/12/07, Robert Schuster <theBohemian@gmx.net> wrote:
> Hi,
> while trying to build glibc_2.3.3+cvs20050221 I noticed that one of the
> patches does not apply. It is simply using a wrong strip value. The
> attached little patch fixes that.
>
> Would someone apply this? I dont have commit rights.

Patch applied -- thanks.

Cliff

-- 
=======================
Cliff Brake
http://bec-systems.com



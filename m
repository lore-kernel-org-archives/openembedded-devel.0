Received: from [209.85.134.190] (helo=mu-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <philipp.zabel@gmail.com>) id 1IipqC-0004GS-Mx
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Oct 2007 13:16:32 +0200
Received: by mu-out-0910.google.com with SMTP id w9so523027mue
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Oct 2007 04:09:46 -0700 (PDT)
Received: by 10.82.162.14 with SMTP id k14mr3255966bue.1192788557412;
	Fri, 19 Oct 2007 03:09:17 -0700 (PDT)
Received: by 10.82.118.8 with HTTP; Fri, 19 Oct 2007 03:09:17 -0700 (PDT)
Message-ID: <74d0deb30710190309s4c794a0gbb960a983ce41c9e@mail.gmail.com>
Date: Fri, 19 Oct 2007 12:09:17 +0200
From: "pHilipp Zabel" <philipp.zabel@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <E1Iinn8-0004il-BP@linuxtogo.org>
MIME-Version: 1.0
References: <E1Iinn8-0004il-BP@linuxtogo.org>
Subject: Re: [oe-commits] org.oe.dev conf/distro/include/angstrom-2007-preferred-versions.inc: add file for locking down almost every package
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
X-List-Received-Date: Fri, 19 Oct 2007 11:16:33 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 10/19/07, koen commit <openembedded-commits@lists.openembedded.org> wrote:
> conf/distro/include/angstrom-2007-preferred-versions.inc: add file for locking down almost every package
>
> ** THIS WILL BE INCLUDED SOON -- REVIEW IT!!! **
[...]
> +PREFERRED_VERSION_bochs ?="2.1"
> +PREFERRED_VERSION_bogofilter ?="0.96.0"
> +PREFERRED_VERSION_bonnie ?=""

bonnie++ ?

[...]
> +PREFERRED_VERSION_dbus ?="1.0.2"
> +PREFERRED_VERSION_dbus-c ?=""
> +PREFERRED_VERSION_dbus-c ?=""

dbus-c++ ?

regards
Philipp



Received: from [66.249.82.228] (helo=wx-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1JeBCY-0008F9-VI
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 Mar 2008 16:36:39 +0100
Received: by wx-out-0506.google.com with SMTP id h27so3667729wxd.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Mar 2008 08:36:38 -0700 (PDT)
Received: by 10.141.50.17 with SMTP id c17mr3424783rvk.146.1206459397471;
	Tue, 25 Mar 2008 08:36:37 -0700 (PDT)
Received: by 10.114.234.12 with HTTP; Tue, 25 Mar 2008 08:36:37 -0700 (PDT)
Message-ID: <19c1b8a90803250836o4651b44u69037448bcb333c8@mail.gmail.com>
Date: Tue, 25 Mar 2008 08:36:37 -0700
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200803251023.51386.geoffrey@pager.net>
MIME-Version: 1.0
References: <200803251023.51386.geoffrey@pager.net>
Subject: Re: AVR32 can build "base-image" target
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
X-List-Received-Date: Tue, 25 Mar 2008 15:36:39 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

you can apply it to all as well.

On Tue, Mar 25, 2008 at 8:23 AM, Geoffrey Wossum <geoffrey@pager.net> wrote:
> Hi all,
>
>  I just submitted patches to the OpenEmbedded Bugzilla that will allow you to
>  build the Angstrom 2008.1 "base-image" target for the AVR32.  Bug #4123
>  (http://bugs.openembedded.net/show_bug.cgi?id=4123).
>
>
>  One of the patches is actually for gcc bug #32388 (ICE in reload1.c), which
>  may be affecting other architectures.  I only applied the patch for the AVR32
>  target.  This patch is included in the mainline gcc 4.2.3 release.  See
>  http://gcc.gnu.org/bugzilla/show_bug.cgi?id=32889 for more info.
>
>  ---
>  Geoffrey
>
>  _______________________________________________
>  Openembedded-devel mailing list
>  Openembedded-devel@lists.openembedded.org
>  http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



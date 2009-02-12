Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LXa92-00081R-TJ
	for openembedded-devel@openembedded.org; Thu, 12 Feb 2009 12:54:16 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LXa7q-0005Y9-K6
	for openembedded-devel@openembedded.org; Thu, 12 Feb 2009 11:53:02 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 12 Feb 2009 11:53:02 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 12 Feb 2009 11:53:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 12 Feb 2009 12:52:51 +0100
Message-ID: <gn12ij$ssf$1@ger.gmane.org>
References: <200902121426.26727.roman@khimov.ru>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20090131 Shredder/3.0b2pre
In-Reply-To: <200902121426.26727.roman@khimov.ru>
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCH] Fix rpm2cio sums
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
X-List-Received-Date: Thu, 12 Feb 2009 11:54:17 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12-02-09 12:26, Roman I Khimov wrote:
> Hello all.
>
> Don't know why, but rpm2cpio tarball checksums are wrong, so here is the fix:

If they are wrong we want to see the diff between the old and new 
tarballs, replacing checksums as soon as upstream changes defeats the 
purpose of us adding them.

regards,

Koen

>
> --- a/conf/checksums.ini     2009-02-12 14:23:11.655542059 +0300
> +++ b/conf/checksums.ini      2009-02-12 14:23:50.520780173 +0300
> @@ -18931,8 +18931,8 @@ md5=b8f0661ac765ce1a2de66ca53e37af83
>   sha256=a8168b8884ab40aadebba0ba696b889e25020d32a88e646d4f4bc56f2236b184
>
>   [ftp://ftp.freebsd.org/pub/FreeBSD//ports/packages/archivers/rpm2cpio-1.2_2.tbz]
> -md5=63f39118ea5ef7cda84a0638002ed6d2
> -sha256=27ffe0392ae193eb04786a2159c099a00fe38ccdaebcebd72afc842c528bb6d3
> +md5=cb0cabdac81b7171843427f32427ca84
> +sha256=20f48aa3c1f950c224e844d3a7d28a679f41173a26a2d7095ef1da27bda42c2f
>
>   [http://downloads.sourceforge.net/rpyc/rpyc-3.02.tar.gz]
>   md5=4e855372c4a533b9ed605503156e6e04
>
>
>
> ------------------------------------------------------------------------
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel





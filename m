Received: from mail-gh0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <aalonso00@gmail.com>) id 1SkRVn-0005Y1-4v
	for openembedded-devel@lists.openembedded.org;
	Fri, 29 Jun 2012 05:04:47 +0200
Received: by ghbz2 with SMTP id z2so2317974ghb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Jun 2012 19:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=KMFLe3rigZeoacNYc9DdR5trqqy5GhQiJNQXb4mYuh4=;
	b=RQQmv4flu6i8xdFYGcbt/77WgbMWJUTSj0YTuSP97OVXuLc9kOjhvp51V0JdVNFJRK
	NZaDcHoAqFIgo98QztoQMPLl4HkkOEPFtml/yzbj8SbRLfttINjlZVMczufgDdviFVD9
	qfnMN7JEUty9/JMTGHLzUxtDs0W+RQBX71Rg8f70nDy8s4fBC7W2UmbLSS61LAVkt3YV
	GZGjqFYZ3Mx2UhkNLQmBepeJ74gLpauCvbChCcp8BUgA0ygrJ0B19QPoHw2bhCNsJh9o
	nV5Mzh0WZTdpUYPuHIYOb9QBjXYtttmuMd8wAt8dWd9B+TX2H59NeibFNsMjh2qdd5K3
	czRg==
MIME-Version: 1.0
Received: by 10.50.186.162 with SMTP id fl2mr298675igc.44.1340938430903; Thu,
	28 Jun 2012 19:53:50 -0700 (PDT)
Received: by 10.64.0.77 with HTTP; Thu, 28 Jun 2012 19:53:50 -0700 (PDT)
In-Reply-To: <2ABBABF5-255A-46DE-9455-69128710E79A@gmail.com>
References: <1340904942-41537-1-git-send-email-elvis.dowson@gmail.com>
	<CAMKF1soU2SERBGQogpQb75YcEju0mYBtK0on=HMRn_Z2Mrp3jQ@mail.gmail.com>
	<2ABBABF5-255A-46DE-9455-69128710E79A@gmail.com>
Date: Thu, 28 Jun 2012 21:53:50 -0500
Message-ID: <CAAB-1yxaMktgywC8XrRtiRxZFiUDh086xG3mkJpAGXVPtXo9KA@mail.gmail.com>
From: Adrian Alonso <aalonso00@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-xilinx] util-linux: rename file to util-linux_2.21.2.bbappend
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
X-List-Received-Date: Fri, 29 Jun 2012 03:04:47 -0000
Content-Type: text/plain; charset=ISO-8859-1

Thanks Elvis, Khem

Patch applied.

On Thu, Jun 28, 2012 at 9:01 PM, Elvis Dowson <elvis.dowson@gmail.com> wrote:
> Hi Khem,
>
> On Jun 29, 2012, at 4:13 AM, Khem Raj wrote:
>
>> if this is a bbappend for meta-xilinx then this is not the right list
>> for this patch
>> Read http://git.yoctoproject.org/cgit/cgit.cgi/meta-xilinx/tree/README
>
> I've resent the patch to the yocto discussion list.
>
> Elvis
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



-- 
Saludos
Adrian Alonso
http://aalonso.wordpress.com



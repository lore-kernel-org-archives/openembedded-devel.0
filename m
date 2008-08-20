Received: from [64.233.166.180] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <shanevolpe@gmail.com>) id 1KVdo1-0003wA-7m
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Aug 2008 04:52:17 +0200
Received: by py-out-1112.google.com with SMTP id y77so168238pyg.28
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Aug 2008 19:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:cc:in-reply-to:mime-version:content-type:references;
	bh=GMAFljcClWtLpi7qg1j3SMyacQ7r8b6w1ayDqMWhzaU=;
	b=U9yNoMRmfc1tpmqAGdj1+8qE381LCrAvNR2EAnm5to6rzrEvwkGUmrxalkME85VPS0
	D5GfIfMwmaVa7Q+Z4lfkDRPssvWvgLUmILSvslUtybUx+Bc0Ebi1mzaxWOA/vLqC/Cxw
	bEBE5Uyi/C0mbKW2DAwBeZJhDQk7Mboxz2FpM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:cc:in-reply-to:mime-version
	:content-type:references;
	b=CIfwIiFoT7tjIi79eclzxyaUcBAEy7eDOMO9g8DBl+cBtT5cQJuDwaGq6lOnChsF85
	qGACOaOMlLDWbimwEpZSsfUwM32cVZchd2607ayJjAMcaofbvET9Ow10KMkyakjod+l5
	YAULOZMlJHQQ1vDSohJcacVyIChoAk/Nriw6I=
Received: by 10.114.12.10 with SMTP id 10mr7442932wal.190.1219200672922;
	Tue, 19 Aug 2008 19:51:12 -0700 (PDT)
Received: by 10.114.24.10 with HTTP; Tue, 19 Aug 2008 19:51:12 -0700 (PDT)
Message-ID: <8c7950360808191951q156e52f3vcdb89e80aac3f692@mail.gmail.com>
Date: Tue, 19 Aug 2008 22:51:12 -0400
From: "Shane Volpe" <shanevolpe@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <g8frq1$5ei$3@ger.gmane.org>
MIME-Version: 1.0
References: <20080817162932.8ECBF18808B@amethyst.openembedded.net>
	<g8frq1$5ei$3@ger.gmane.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: openembedded-devel@openembedded.org
Subject: Re: : php-native: Updated to version 5.2.6
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
X-List-Received-Date: Wed, 20 Aug 2008 02:52:17 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Rolf,
Sorry it looks like I committed the php-5.2.6 directory but the files in it
did not commit (I forgot the recursive option) I'm going to commit them
now.  I will look into the mysql-native issue tomorrow.
Regards,
Shane

On Tue, Aug 19, 2008 at 9:25 PM, Rolf Leggewie
<no2spam@nospam.arcornews.de>wrote:

> OE GIT Trial wrote:
>
>> Author:  <svolpe@openembedded.org>
>>
>
>  php-native: Updated to version 5.2.6
>> *Replaced the old version 5.2.5 with 5.2.6
>>
>
> Hi,
>
> did this actually work for you?  For me, compilation of mysql-native fails
> as well as do_patch for php_5.2.6.
>
> Regards
>
> Rolf
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



-- 
Registered Linux User: #293401


Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <aalonso00@gmail.com>) id 1SaJUA-0001yU-QT
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Jun 2012 06:29:14 +0200
Received: by yenl13 with SMTP id l13so1480062yen.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 May 2012 21:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=zdEomI0Ch57uWekzRvH6aZ+kUjX1CUkocqG+0QLFs00=;
	b=io4tq6e+FNT1vVIaM8anH9YtHHuRKcpupHbyWhqByI0O35AMv/RDZfXdRsLQEuLKmg
	QxVez76mdfrDb+QxtaXBR8A39dpy/+VTcVdkOK2cOIrSugQucmo/zQnxBB6Ch6omm2s5
	EUiG3KMwOiSMdCsZJPpq+2Xhlio8u9PGL9zLfwBmLw2RSlclsHmTEHIJXCOcCDhzO93c
	TvQIILDXmlMoDasqIQ3fL075+KMXkuGmoSOOHthJ4ujGfLTEJTISyEYi50g4J0xKD/FO
	rQMmmOfpbnJekQzmzx+cb7Tc6kcF8yxxpVnL1fLUqxOU3menGRMUMItXUj9JqXx0oCCv
	EU9Q==
MIME-Version: 1.0
Received: by 10.42.62.195 with SMTP id z3mr645134ich.9.1338524333600; Thu, 31
	May 2012 21:18:53 -0700 (PDT)
Received: by 10.64.0.77 with HTTP; Thu, 31 May 2012 21:18:53 -0700 (PDT)
In-Reply-To: <2729A91D-A5DA-4BD7-8F6F-64D8EFC12DE5@gmail.com>
References: <1338445392-39723-1-git-send-email-elvis.dowson@gmail.com>
	<CAAB-1ywGdhaePDp05Cmm90NtGVSUPbRqGtRtO2XkVMd9NnK+Gg@mail.gmail.com>
	<2729A91D-A5DA-4BD7-8F6F-64D8EFC12DE5@gmail.com>
Date: Thu, 31 May 2012 23:18:53 -0500
Message-ID: <CAAB-1yzPJEqCUJq-MTdNvmxL1fsbqhV4NepcnszC1--u0HddLQ@mail.gmail.com>
From: Adrian Alonso <aalonso00@gmail.com>
To: Elvis Dowson <elvis.dowson@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-xilinx] tune-ppc440.inc: Update support for the PowerPC 440 processor in the Xilinx Virtex-5 FXT FPGA.
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
X-List-Received-Date: Fri, 01 Jun 2012 04:29:15 -0000
Content-Type: text/plain; charset=ISO-8859-1

Applied

Thanks

On Thu, May 31, 2012 at 11:53 AM, Elvis Dowson <elvis.dowson@gmail.com> wrote:
> Hi Adrian,
>
> On May 31, 2012, at 5:15 PM, Adrian Alonso wrote:
>
>> Please update your meta-xilinx repo,
>> commit: 04633e44b5401288ceee2d36eb2413dfa5308a54
>> does something similar, but I fail to use "powerpc-nf"
>>
>> I would accept a new patch for that :)
>
> Done! :-)
>
> Best regards,
>
> Elvis Dowson
>



-- 
Saludos
Adrian Alonso
http://aalonso.wordpress.com



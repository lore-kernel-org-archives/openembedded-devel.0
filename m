Received: from [209.85.198.226] (helo=rv-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1LKybk-0000ZE-1Q
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Jan 2009 18:23:48 +0100
Received: by rv-out-0506.google.com with SMTP id f9so7844550rvb.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Jan 2009 09:17:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:cc:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=TCml+xKfqRKhLSmssQ6AbnfVhAeicmJ5kMmL8+lLyR0=;
	b=iKE4W4oHBbKL/dUZU1PRiV5ixKzhr5K52+DkMVz31BOP4jJUpnmyoHM3G6HA+iz2rG
	hMkpBJFfUPwnii+UH6V/RIRQ1+bw3AgRXFiFIQc+5Jq3Zxd1Jz18yPrP1Rz6Emg1jS0I
	/KOJ6lpTm64oEIG6BdEVN2syXdiUB9OzTY5B8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:cc:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=Uej2wBHJ4bwI2JpLphfc6D8OSBg6prumJ1hCHnnthC/79tNnqsaMkYLX5NXlrVhw+y
	MGu73V2uX+eMSrC4RhAvWjzHKUBTwMM60wLtJDmIH2I2NerRdmISFWjidtTO7fG907Xj
	h5/ObLFrPfH9u4siC7u+2tX7vXpyuKKBJZh1M=
Received: by 10.141.168.2 with SMTP id v2mr12242971rvo.47.1231435058154;
	Thu, 08 Jan 2009 09:17:38 -0800 (PST)
Received: by 10.141.142.17 with HTTP; Thu, 8 Jan 2009 09:17:38 -0800 (PST)
Message-ID: <f96d234e0901080917n77601f9cr1593b813b3451fab@mail.gmail.com>
Date: Thu, 8 Jan 2009 12:17:38 -0500
From: "Cliff Brake" <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <565965130901080657i4789129fy971a69f0a929300c@mail.gmail.com>
MIME-Version: 1.0
References: <f96d234e0901080537k6c1dfa9bm77ca6c03c24f1a49@mail.gmail.com>
	<565965130901080657i4789129fy971a69f0a929300c@mail.gmail.com>
Cc: opkg-devel@googlegroups.com
Subject: Re: opkg-cl: corrupted double-linked list
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
X-List-Received-Date: Thu, 08 Jan 2009 17:23:48 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, Jan 8, 2009 at 9:57 AM, Tick Chen <ticktock35@gmail.com> wrote:
> Hi Cliff,
>  Would you like to compile a opkg with -g2 and test again?

Yes, will do.

> Which branch and version on OE do you used and which version of
> opkg-native do you compiled?

org.openembedded.dev f599ffebf9c4133e71fb7095612e9b59de1a83ab (from
this morning)

Its strange that it only happens with the x86 target machine.
gesbc-9302, cm-x270, and beagleboard all built fine.

Thanks,
Cliff

-- 
=======================
Cliff Brake
http://bec-systems.com



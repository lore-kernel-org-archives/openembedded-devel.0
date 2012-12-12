Received: from mail-la0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <akini@synapticon.com>) id 1Tinr4-00017m-5h
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Dec 2012 16:04:14 +0100
Received: by mail-la0-f47.google.com with SMTP id u2so654400lag.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Dec 2012 06:49:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type
	:x-gm-message-state;
	bh=GveOaosWgzc0jtFJF4HRpYlNkOGrd7aeRRLZwJJuyxU=;
	b=ObTCfmXK1c/txAsF/UhaRhg+VRHx2EI7u1YGS0CpQYH+1ETx3p9K4EkelQkFsooAWo
	8YF3HaTwqepT5tQ2ponZQRx5Fizw+neLz5tf4Pwk0kvYwVjUyiEWHcazlW59whA0GXxT
	fJAih7mPgLB6o/cT5kXGAlgUzIvly0YSYU0TQJtQzKZuNJBmJ/P16aXZEc3/9KWzxNl7
	N9OatgKnt8HI9s5HGNHF9bcfPdC/z3yMXVUDXQJw3nu98RLfvOCaWTrgf3lpswS6Xhjz
	qci5HYMVtIXTd65+RIMbuLgQbnDHQlng57gT+PKEOcmHEdc/KWT+7RysdN0XFULnuxWE
	ciLw==
MIME-Version: 1.0
Received: by 10.152.129.197 with SMTP id ny5mr1305206lab.43.1355323780379;
	Wed, 12 Dec 2012 06:49:40 -0800 (PST)
Received: by 10.112.60.36 with HTTP; Wed, 12 Dec 2012 06:49:40 -0800 (PST)
Date: Wed, 12 Dec 2012 15:49:40 +0100
Message-ID: <CAKS01o=6cYVARN=nQcMiLCzSSAV+XossK0Zg6-AxzpPOzgUBNg@mail.gmail.com>
From: Anup Kini <akini@synapticon.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQncuggwCF1B3nsfX039ZHFAdbrv6GnnrgnF7sINp9iuoQ/+YRMqlNUfAG2+RtAgkqkBU2WI
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: building OE with arm-gcc
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
X-List-Received-Date: Wed, 12 Dec 2012 15:04:15 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi All,

I am trying to build and OE platform for ARM Cortex A9, which is a part of
Xilinx ZYNQ 702 SoC.
My application will include the use of Point Cloud Library.

I wanted to know if any one has already tried to integrate an arm gcc for
the OE platform.
Any suggestions or pointer on building with arm gcc will be very helpful.

-- 

*Anup Kini
*Systems Engineer****
*
------------------------------
*

*Synapticon** * |  Cyber-Physical System Solutions ****

Direct:****

+49 7335 / 186 999 17****

Fax:****

+49 7335 / 186 999 19****

 ****

 ****

synapticon.com <http://www.synapticon.com/>  |
@synapticon_co<https://twitter.com/#!/synapticon_co>
****

Synapticon GmbH  |  Hohlbachweg 2  |  73344 Gruibingen, DE
Secretary +49 7335 / 186 999 0  |  General Manager: Nikolai Ensslen
Registry Court Ulm HRB 725114  |  USt-ID DE271647127****

This message and any files transmitted with it are confidential and
intended
solely for the use of the individual or entity to whom they are addressed.
Please notify the sender immediately if you have received this e-mail by
mistake and delete it from your system.


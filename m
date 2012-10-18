Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch-fe.de>) id 1TOqNj-0001Xr-03
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Oct 2012 15:43:27 +0200
Received: by mail-bk0-f47.google.com with SMTP id jk7so3715086bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Oct 2012 06:30:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding:x-gm-message-state;
	bh=kv4mNfJ8zsRQUZXQNQeckW4zJaxqnMHITztsO1QUnLs=;
	b=dH005kK4GcjhcCx9X2/fuzOwfTfoAsdWzIZKIhc3kHxgF1ToQ3RJ7dRSbFM4S3l/mp
	oEksPDz0i02Lsrqdwh+Td0ItbZR+g/gIkj8bNJn7csV/7j2XUkfQAeqVPX+SZbDnRroy
	04Y59akBtdhanuygqJjBn1J+n7b7sGjqsPWtipZ/LIG0Aqo7roCujM1RcWQlhXwpVssL
	cNZc5ZNq26WVdiHz4p/s16VyLTIMaMVKDisl6v5kSFtiYzg9H68wqzFnchNjMXJwQopa
	9TNPqqoe3LIC6PhTTfNSomNjKthttDCLxFsfcu7ultiENIhMjqWrwcxtwT8OcWkWNMiW
	81og==
Received: by 10.204.131.75 with SMTP id w11mr6484957bks.111.1350567007453;
	Thu, 18 Oct 2012 06:30:07 -0700 (PDT)
Received: from mobil-400-586.intern.dresearch.de
	(pd95cbf07.dip0.t-ipconnect.de. [217.92.191.7])
	by mx.google.com with ESMTPS id v14sm14951537bkv.10.2012.10.18.06.30.06
	(version=SSLv3 cipher=OTHER); Thu, 18 Oct 2012 06:30:06 -0700 (PDT)
Message-ID: <5080045D.4020105@dresearch-fe.de>
Date: Thu, 18 Oct 2012 15:30:05 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:16.0) Gecko/20121010 Thunderbird/16.0.1
MIME-Version: 1.0
To: Henning Heinold <heinold@inf.fu-berlin.de>
References: <cover.1349466172.git.sledz@dresearch-fe.de>
In-Reply-To: <cover.1349466172.git.sledz@dresearch-fe.de>
X-Enigmail-Version: 1.4.5
X-Gm-Message-State: ALoCoQnoNvmhzisrlGUanpZOa9tNki14wYm30A36zFYy1X5ZnzP/Ddi0Th1KfoIwtnhlchiPnioV
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-java 0/5] icedtea build fixes
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
X-List-Received-Date: Thu, 18 Oct 2012 13:43:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05.10.2012 21:45, Steffen Sledz wrote:
> Hi meta-jav maintainers,
> 
> this is a set of patches which make icedtea6-native-1.7.10 and
> icedtea6-native-1.8.11 buildable for us.
> 
> The following changes since commit da13c12203a4ba9020d7083861c0038c8ee67c88:
> 
>   openjdk-6: update to version 1.11.4 (2012-09-10 20:43:55 +0200)
> 
> are available in the git repository at:
> 
>   git://github.com/sledz/meta-java pull-request-1
>   https://github.com/sledz/meta-java/tree/pull-request-1
> 
> Steffen Sledz (5):
>   icedtea6-native-1.7.10: add missing LIC_FILES_CHKSUM
>   icedtea6-native-1.7.10: backport S7103224
>   icedtea6-native: fix problem on build hosts with linux kernel 3.x
>   icedtea6-native: fix compile error
>   icedtea6-native: fix build problem

Ping!

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058




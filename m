Received: from [64.233.162.226] (helo=nz-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <pmiscml@gmail.com>) id 1HVXCs-0000K7-Rz
	for openembedded-devel@lists.openembedded.org;
	Sun, 25 Mar 2007 20:12:44 +0200
Received: by nz-out-0506.google.com with SMTP id m22so1107541nzf
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Mar 2007 11:12:41 -0700 (PDT)
Received: by 10.64.10.2 with SMTP id 2mr11336782qbj.1174846361440;
	Sun, 25 Mar 2007 11:12:41 -0700 (PDT)
Received: from cube ( [82.193.98.7])
	by mx.google.com with ESMTP id r15sm9873081nza.2007.03.25.11.12.39;
	Sun, 25 Mar 2007 11:12:40 -0700 (PDT)
Date: Sun, 25 Mar 2007 21:12:38 +0300
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <1848684762.20070325211238@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <7c8eac300703130353t4982c66bua4f24205e4e651d6@mail.gmail.com>
References: <274295013.20070311040657@gmail.com>
	<7c8eac300703110856v1e825559x8f89abd79d17fed8@mail.gmail.com>
	<665468377.20070311213332@gmail.com>
	<7c8eac300703130353t4982c66bua4f24205e4e651d6@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: [RFC] Allow to limit generated binary locales to predefined list
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
X-List-Received-Date: Sun, 25 Mar 2007 18:12:50 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello,

>  Binary locale generation for the entire locate set provided by GLIBC
> takes noticeable amount of time (several hours).
[...]
>   The solution would be to allow to optionally constrain set of
> generated locales to a predefined list.

> GLIBC_GENERATE_LOCALES = "en_GB.UTF-8 de_DE.UTF-8"

  Committed.


[]

-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com




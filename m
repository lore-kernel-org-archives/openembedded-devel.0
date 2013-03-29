Received: from mail-da0-f44.google.com ([209.85.210.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1ULUsy-0000WD-M4
	for openembedded-devel@lists.openembedded.org;
	Fri, 29 Mar 2013 09:42:09 +0100
Received: by mail-da0-f44.google.com with SMTP id z20so151518dae.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Mar 2013 01:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=mfReJ5LoM4BNbvkkOMoZ5VQlC9tjCqhi1JwS2Ul2gqY=;
	b=HWdrRsoNXve9iIKeYLjrDYwVW0Ss0RTf2DwaOaLJZ22RCPAZgNbLzAOG8C2YiXmIhG
	/jQqSEFJPvR9NLNIS/7YAV7ML0VaW2egQTfgcDh+GILbrBedvbWx4Wp7iZ5C3zFecJOj
	aTxbhkXazXue4SY0bql8o8eRH2G0XjmLAqVYrNtMGV8NaftpnpWknLnVCGF9AbHG6upq
	OV231nJ6v3RPskOZOoB/5y7XCtjfwiyahPtjpl2AuiYWwnGK+TAOd+MRjKyzNega2pZ1
	jnh6qbAgCctBSjxEQgr9q4UfOHVlwIemqddFJGc+qB5lj65cv2ekbnm6+EMqEKIH4P6G
	UMqQ==
X-Received: by 10.66.248.227 with SMTP id yp3mr3146388pac.158.1364545504342;
	Fri, 29 Mar 2013 01:25:04 -0700 (PDT)
Received: from [192.168.1.100] ([94.205.105.6])
	by mx.google.com with ESMTPS id f4sm2065721pbc.6.2013.03.29.01.25.01
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 29 Mar 2013 01:25:03 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Elvis Dowson <elvis.dowson@gmail.com>
In-Reply-To: <EEAF4EC9-48F2-494E-8738-288B1786D9B2@gmail.com>
Date: Fri, 29 Mar 2013 12:24:57 +0400
Message-Id: <70527E10-EB04-4D30-931C-ADD8D7F237A4@gmail.com>
References: <y> <1364543252-18751-1-git-send-email-elvis.dowson@gmail.com>
	<EEAF4EC9-48F2-494E-8738-288B1786D9B2@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Mailer: Apple Mail (2.1503)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [openembedded-core-contrib] gcc-4.8: Refactor gcc-4.8.0 patch files.
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
X-List-Received-Date: Fri, 29 Mar 2013 08:42:11 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi Khem,

On Mar 29, 2013, at 11:55 AM, Khem Raj <raj.khem@gmail.com> wrote:

> You did not mention whats refactored. One thing I notice they are git =
am'able now
> however you are signed up as author of all the patches if you send =
that email via git send-email
> and if you send patches upstream like that you will be frowned upon. =
So if you were adamant to gitify them
> you should have done --autho=3Dblah while committing them

I've manually changed each patch files From: to your name and address, =
and appended to the last commit
in my local tree. I've just sent across the modified files.

Best regards,

Elvis Dowson=



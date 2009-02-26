Received: from [209.85.198.249] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hvontres@gmail.com>) id 1LcWRC-0002ha-R5
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Feb 2009 03:57:27 +0100
Received: by rv-out-0708.google.com with SMTP id b17so334262rvf.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Feb 2009 18:54:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=HzNx6xWm4+ePFmWbNV3vZuVHXL01M4FmQisAwp9njA4=;
	b=nBqdi2x+lzilrWnfnj+ywx5qlttPG6XLl4L8E0dFkIDt/S84/MPq5rCgIsNxoPK+pq
	dx/Nk4I9wygKNGQKX+JUtBgE3m8HB+dVbmrFzQHAmakgW62ajs1e3swSAag+yOkosRht
	oMecHMoj37CeraOiSaRCHjb4IlrbCpYKFnbS0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	b=FKMD9I6QWiZpXTJVoSop90aBUG0uoGIpm1eOompbhy8QL2GcslyFJpjNA+tDnbk3Q6
	DcIFJ9mOVU77hRnYncDD3QS0LlfA6WRBwU9nZaLzN+xkJU204cmfYu3/HABAbV7u2wFR
	mbpJ5F4vlanJmVyKrs2KDB/Wo+GHdJtZJv0go=
Received: by 10.141.41.12 with SMTP id t12mr337894rvj.289.1235616851458;
	Wed, 25 Feb 2009 18:54:11 -0800 (PST)
Received: from localhost (adsl-75-8-123-171.dsl.sndg02.sbcglobal.net
	[75.8.123.171])
	by mx.google.com with ESMTPS id g22sm45465rvb.0.2009.02.25.18.54.10
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 25 Feb 2009 18:54:11 -0800 (PST)
From: Henry von Tresckow <hvontres@gmail.com>
To: "oe-devel" <openembedded-devel@lists.openembedded.org>
Date: Wed, 25 Feb 2009 18:54:08 -0800
Message-Id: <1235616849-19663-1-git-send-email-hvontres@gmail.com>
X-Mailer: git-send-email 1.5.4.3
In-Reply-To: <>
References: <>
Subject: [PATCH] sg3-utils: Updated Makefile patch to deal with cross-compiling - resend
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
X-List-Received-Date: Thu, 26 Feb 2009 02:57:29 -0000

Please Review and apply if ok




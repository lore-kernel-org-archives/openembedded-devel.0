Received: from [209.85.132.242] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1M4EHV-0006WB-Mj
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 May 2009 15:13:57 +0200
Received: by an-out-0708.google.com with SMTP id b6so167569ana.42
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 May 2009 06:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=bDBunN/XS6rEp4C+z1A5YVFBDpBsA13sMONJJgsBhhg=;
	b=OASrydXvkb1tGKNqWtJWjOiqCNiU+EypmzTZpCTkGIm3bJEKcoK5/bAQtACxoI7MDz
	ufgjR5IhHBC4qEo7FA7sMQQuqKiWIzGBxtNDMtI1e1SXi+6nS9KOXI9QXk4cAlZRvpVV
	lyLJ5XMl28HwTgPvC6Ze+462tKAFCGSoxVvTE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=WgkB3vtf39UvTksxB9ZQT6ZGE7072jokZ+3f1MZo22VHx+NIkFEtPQfxZtNuNTnE/h
	yA35kJiXuBzyokkYucR2iBMNPHWVmmMh+uLQYzJf1CU38vc2Lt0W33qJ6KK17Wnrjfuc
	qDcK5YrtNFtiafjUTqAsxoGYJWKMJeNI4oYu8=
MIME-Version: 1.0
Received: by 10.100.209.5 with SMTP id h5mr137873ang.124.1242220033593; Wed, 
	13 May 2009 06:07:13 -0700 (PDT)
In-Reply-To: <1242207556-15601-23-git-send-email-k.kooi@student.utwente.nl>
References: <1242207556-15601-1-git-send-email-k.kooi@student.utwente.nl>
	<1242207556-15601-23-git-send-email-k.kooi@student.utwente.nl>
Date: Wed, 13 May 2009 15:07:13 +0200
Message-ID: <ac9c93b10905130607p11577a94jabfb6a0526a3a9e7@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [STABLE][PATCH 22/37] gpe-su: remove unused entries from checksums.ini
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
X-List-Received-Date: Wed, 13 May 2009 13:13:57 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

It was my impression that removing checksums from checksums.ini was not done.
Am I mistaken? Please enlighten me.

Frans



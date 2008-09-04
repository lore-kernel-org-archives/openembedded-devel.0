Received: from [209.85.198.242] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1KbLdB-0003RQ-W1
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Sep 2008 22:40:42 +0200
Received: by rv-out-0708.google.com with SMTP id f25so137433rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Sep 2008 13:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:mime-version:content-type:content-transfer-encoding
	:content-disposition;
	bh=u6G9+wCAW9LuiWPcVD/KhIJNBI1qhALkXR/tR1BB45M=;
	b=CjVobxrXyF4u72VcPmqXlKhW7iuLNLRwKlHrNC+bFvnMwzQN0SGsQ5KvBFg/u+y8gs
	SKSUAfYQ3X44mIWrsUBcwfU+WT+acwxSxb3/2ITgDIcrrHsnfKSx2t2nSKqE0f48uTcQ
	WR8T47/oZIxSBmSZ3bRo17vy9VXupSOpGMbUM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:mime-version:content-type
	:content-transfer-encoding:content-disposition;
	b=yIGhx4udQPwgQpHev9ZreccUJUJvlE3TmTpP9wSXwHlG7rXE4EtmoSsobK2wuSuCoJ
	e/RDhlqsInkw0DpOl5MnhjwN6z974XDzCXa10vrTQVtKOvgjvxAX4VaKYeJKDvOdbmgp
	ndvy8HuwW0VPpSX96vnPDIAvXlFBVxVmNZ7lg=
Received: by 10.141.76.21 with SMTP id d21mr5999166rvl.242.1220560709684;
	Thu, 04 Sep 2008 13:38:29 -0700 (PDT)
Received: by 10.141.163.6 with HTTP; Thu, 4 Sep 2008 13:38:29 -0700 (PDT)
Message-ID: <c384c5ea0809041338t15ff7146m42b94c3723410ce6@mail.gmail.com>
Date: Thu, 4 Sep 2008 22:38:29 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
MIME-Version: 1.0
Subject: PREFERRED_PROVIDER_x/y = "z" versus PREFERRED_PROVIDER += " x/y:z"
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
X-List-Received-Date: Thu, 04 Sep 2008 20:40:42 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,

can someone explain the (subtle) differences between

PREFERRED_PROVIDER_x/y = "z"
PREFERRED_PROVIDER += " x/y:z"
?

And also (to be completely clear) when to use what?

Thanks,
-- 
Leon



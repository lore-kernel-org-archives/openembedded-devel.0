Received: from [209.85.132.247] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mario.goulart@gmail.com>) id 1LxSeC-0004nE-6y
	for openembedded-devel@openembedded.org; Fri, 24 Apr 2009 23:09:24 +0200
Received: by an-out-0708.google.com with SMTP id c3so783862ana.30
	for <openembedded-devel@openembedded.org>;
	Fri, 24 Apr 2009 14:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:from:to:subject:date
	:message-id:user-agent:mime-version:content-type;
	bh=jY8eTrNcCONs31qoBK0dE/y+MYm74WMI4Egh5/T0Hb0=;
	b=fc3qJXYYqLPDLf2TlF4GXgxwqc+/zZ+GVTKrq8mdvfe6jEGLLJz71pno3VjoUZTdsY
	OmTT5byZq+E+JoA3o1vbUFM+Ccf/NGfzPfZtKgHa6sE7UEMh86pBvHgWTbA8qvTweLi4
	ye68x2pHfZDdXXsAVTntkNK0R6qbXHd5EvVMU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:user-agent:mime-version
	:content-type;
	b=EPJgiphHygX7zXvBh3CAfY744i10bA7R2BMPucdhWV2kSxjEJI43j/L5EXceq8xc8H
	csHsZTSCXTNBadHIhi191k+VY1Im8TpbrPerpEEiUEq27vmhbQM8Hh1bZ1RZAUnOUxRW
	3YKronb1dN31IkXt+d1a5+D9WHtINhl4TZiFY=
Received: by 10.100.240.17 with SMTP id n17mr3854734anh.1.1240607078154;
	Fri, 24 Apr 2009 14:04:38 -0700 (PDT)
Received: from nachos.gmail.com ([189.30.52.126])
	by mx.google.com with ESMTPS id c28sm128677anc.9.2009.04.24.14.04.36
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 24 Apr 2009 14:04:37 -0700 (PDT)
Sender: Mario Domenech Goulart <mario.goulart@gmail.com>
From: Mario Domenech Goulart <mario@ossystems.com.br>
To: openembedded-devel@openembedded.org
Date: Fri, 24 Apr 2009 18:04:30 -0300
Message-ID: <878wlp2275.fsf@ossystems.com.br>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.0.60 (gnu/linux)
MIME-Version: 1.0
Subject: User Manual: IPKG_INSTALL
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
X-List-Received-Date: Fri, 24 Apr 2009 21:09:24 -0000
Content-Type: text/plain; charset=us-ascii

Hi

Chapter 9 from the User Manual mentions the IPKG_INSTALL variable (items
6 and 13 from the "rootfs_ipkg class" section).  I can't find this
variable in rootfs_ipk.bbclass.  Shouldn't this variable be
PACKAGE_INSTALL instead?

Best wishes.
Mario



Received: from [209.85.198.249] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <e.robertson.svg@gmail.com>) id 1KDhHN-0003zv-VN
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Jul 2008 16:56:26 +0200
Received: by rv-out-0708.google.com with SMTP id f25so2048683rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Jul 2008 07:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:user-agent:mime-version:content-type:content-transfer-encoding
	:content-disposition:message-id;
	bh=0CKOvWeg9j9ClpHduqIItnRfNoOq3SWcFf4HbLjwgoc=;
	b=LGNnylFdYqvpPR2KrfS6aYOGsqYtHRNeYFB5cOyZNnsSnRwOBQpuTo1KZNhZKPMgkb
	wvoaLHYn4obOA9VtId+fqBV412i0zx7vcKO+mcl+YBipimFSG2ulCe9/inD6n2ohSSWB
	Ob75rOtqKvbtEQ9OkedHbcXzbpY6VIRdzhYuQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:user-agent:mime-version:content-type
	:content-transfer-encoding:content-disposition:message-id;
	b=H0RatuYdOy48npLV29QfuGPsq44nHRTjqLoYJo13+5ZXdnsInz260A5mvmBD4xKQLg
	MwZJ8/DxvwacjlWpsNZtdPMJIB9X1BonHjgOplF+UMgPYtKnpzIir6k6X3+Q0hemv3Ye
	hPAoiyBkTaHaR7QXcWApl89CVSKmuul3lUqlY=
Received: by 10.141.5.17 with SMTP id h17mr3605442rvi.8.1214923998792;
	Tue, 01 Jul 2008 07:53:18 -0700 (PDT)
Received: from vincy ( [74.254.162.162])
	by mx.google.com with ESMTPS id 9sm1212166yxs.5.2008.07.01.07.53.17
	(version=SSLv3 cipher=RC4-MD5); Tue, 01 Jul 2008 07:53:18 -0700 (PDT)
From: E Robertson <e.robertson.svg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 1 Jul 2008 09:53:02 -0500
User-Agent: KMail/1.9.9
MIME-Version: 1.0
Message-Id: <200807010953.02888.e.robertson.svg@gmail.com>
Subject: Having multiple bb files
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Tue, 01 Jul 2008 14:56:26 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi,
Can I have multiple bb files for the same package (same version)?
If so, how do I separate them and how do I set a default one for bitbake to 
build? (i.e without using the -b option).
Thanks. 



Received: from [66.249.82.225] (helo=wx-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jpaechnatz@gmail.com>) id 1Jr8HK-0003Z4-9R
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Apr 2008 11:07:06 +0200
Received: by wx-out-0506.google.com with SMTP id h27so471450wxd.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Apr 2008 02:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
	bh=+0ofI9HEIQNlH3czrKGFDaxHHwGR9dliYzw5atkypWM=;
	b=fun6pVnMhLiuiK06hEfq65lx9feguteH8enJWIKrJbajSN77ODFvSgDvdlnu6hQSPpb4zps4V/3btksCDtiSf2YCz+FIQaQuH70JpJH1rn26GXkHtJmSUUkfCUcebWPsQhq7FDqOxnPe41i3/cikLI37qI9wp0jK2iMKQE3ZAGM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
	b=AplDO/8n3doMXAeUM8XB+5F0cZkZwb4C59UxiXqmkjVkjmSHA3I/iSVSdFmOEQAXiIRFDxBKmrZa8vsCYpNAh+w78DDRcH+irp90zmN0T/gBPVLd0I05YKMvEUMOFOyqGWUw64wjHRVr5xhyGWUKEbGTPWJyUCf6QbpU2txCzmA=
Received: by 10.90.29.13 with SMTP id c13mr751856agc.114.1209546395098;
	Wed, 30 Apr 2008 02:06:35 -0700 (PDT)
Received: by 10.90.97.16 with HTTP; Wed, 30 Apr 2008 02:06:35 -0700 (PDT)
Message-ID: <8609a9b90804300206o7e36c62ap7e28b82b26ab84e9@mail.gmail.com>
Date: Wed, 30 Apr 2008 11:06:35 +0200
From: "Johannes Paechnatz" <jpaechnatz@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: pxa machine conf?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Wed, 30 Apr 2008 09:07:06 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

I try to compile a package for a specific machine, but even searching
in the machine.conf files doesn't helped to figure out the right
config.

Machine: Pocket Loox 718/720, PXA272. I tried htcuniversal.conf but it
seems to build arm5... binaries?

thanks.



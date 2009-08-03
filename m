Received: from [209.85.198.248] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MY4ka-0008GB-AC
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Aug 2009 23:07:20 +0200
Received: by rv-out-0708.google.com with SMTP id l33so1009053rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Aug 2009 13:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:mime-version:content-type:content-disposition:user-agent;
	bh=drLZh+CXfkYj7SfaW6MNXLr0mXDUUqIkFgUYlZSb0Vo=;
	b=aT6c1o2UUQ9tCWj6ruZMabxuz3gIlB7MCRd9J1MwNVlo59DuPYwLH1/bd5C8qWovDL
	4kUNYxG54Sz0UEC2O14QVZmin+etp5LzihWR8u6uBVOA6Xrk6frOu0shgN6mjAuPczZ8
	JOQNScdKYbQ5dpCUWnFiR+y1wif3zo0s655+M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	b=V0AITmZFsF40cN4LFYCu83KLgBbf6eEjynG3mzYYk6BTBESa3tmE4xbNNLNDemPIGr
	6s9PJunZYGn7SLOKRJx8W1v2nEmr2F6+wPDAqWnxa78hfyT4mg3kOGOcSMQ+vnVypKEG
	6frNRQ/f0IEjdHxBDzr5GNC34mQg2BCDSw+Qc=
Received: by 10.140.187.11 with SMTP id k11mr4038256rvf.105.1249332711520;
	Mon, 03 Aug 2009 13:51:51 -0700 (PDT)
Received: from gmail.com (adsl-71-146-25-49.dsl.pltn13.sbcglobal.net
	[71.146.25.49])
	by mx.google.com with ESMTPS id b39sm791353rvf.3.2009.08.03.13.51.49
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 03 Aug 2009 13:51:50 -0700 (PDT)
Date: Mon, 3 Aug 2009 13:51:43 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090803205143.GA19457@gmail.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: [RFC] Removing uclibc recipes older than 0.9.28
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
X-List-Received-Date: Mon, 03 Aug 2009 21:07:20 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi

I would like to propose to remove uclibc recipes which are older than
0.9.28. If no one objects then I will go ahead with the deletion next
week.

Thanks

-Khem




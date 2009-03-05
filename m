Received: from [209.85.218.165] (helo=mail-bw0-f165.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1LfF7r-000605-QG
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Mar 2009 16:04:43 +0100
Received: by bwz9 with SMTP id 9so3274299bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Mar 2009 07:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=4dsJgwcm19aTn5GpaRsYmBDFR1G2YdV3aPxTdx7MX5c=;
	b=VUwGOiP/mxKEL+v4GReAw/PHQnPNZqsuX/rDemBGSm57CzR9rRiVIAdZDRp/+NUhWI
	nQeoiJyelYvtZUlTa2EwfsGV+Az4Nx8ZCdBu7J5FvXMgNHJoOzNOolXMDLWaeo67iBkA
	YhsA4T7ZaTvk0TcCMf2w+bRVrFR3x/rNa7510=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=dmQxN1hcDVtQ3A8dRZ17W5LRUmLO6c5cI6LvbGkpFtZ9cjBUqQaGZ1VenDxqyaADMl
	GZEUhowXjattWXHE/g6j1qVBc04WICfDrfY4t2qzSrrzELedEaQaj6u1NPS9N58Lhxas
	RVeGdVwAAt6nPk9+wXfwJDo4gMQlwPDTK2VXM=
MIME-Version: 1.0
Received: by 10.223.115.80 with SMTP id h16mr1007198faq.94.1236265220889; Thu, 
	05 Mar 2009 07:00:20 -0800 (PST)
In-Reply-To: <49AFDBA5.7000308@balister.org>
References: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
	<1236182004-4523-70-git-send-email-openembedded@haerwu.biz>
	<49AF4FBD.1010209@dls.net> <20090305044711.GE26343@smtp.west.cox.net>
	<49AFC6A3.9070406@dls.net> <49AFDBA5.7000308@balister.org>
Date: Thu, 5 Mar 2009 16:00:20 +0100
Message-ID: <ac9c93b10903050700g423ba896k658be62863eede@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: I got the point - did everyone one else? [was: Re: [PATCH 70/70]...]
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
X-List-Received-Date: Thu, 05 Mar 2009 15:04:43 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Is the policy now to send *all* patches to the list?
Or only the critical ones (e.g. the ones that affect the build system
and core functionality)?

Frans.



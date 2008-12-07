Received: from [209.85.128.188] (helo=fk-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1L9HEz-0003c3-1k
	for openembedded-devel@lists.openembedded.org;
	Sun, 07 Dec 2008 11:51:57 +0100
Received: by fk-out-0910.google.com with SMTP id 19so782031fkr.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 07 Dec 2008 02:48:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=yxOWXaB1tM9vrLEm/LSoClrCrzuSr5GOri+OrfpEjEc=;
	b=fvzdfIQEQxjen0up6bmUOeJ3ANkzFOEJrw6mrmLqCZpPGI6SvdNKLKlVVApD3sxcw5
	2/aVieD1nl3wY9Wt9spLdTJdEIP/f3XjSOOEz87B0mpHmuzkzn41yGN19rCojdwm9hR9
	13tmg8tMheORlXiRZn7Y1PVh38Fk5z+4kYCeg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=UQ35ijwlYcXzKTR469OgApOjYeSqLVe7v7DGP/zW4PA55B/VXS2RITsc0Z6egZJNJp
	LlJeBUyVH6hcs4kuyY8QXg7ggbtiXrUss469Em5rGsJw07GU85jzLuKeAKgfGy6brIPu
	vLv9l1HaGb0+Yj/UPT9FrqAgUTfV3b0LdAUVk=
Received: by 10.181.197.6 with SMTP id z6mr776501bkp.119.1228646890071;
	Sun, 07 Dec 2008 02:48:10 -0800 (PST)
Received: by 10.181.52.8 with HTTP; Sun, 7 Dec 2008 02:48:10 -0800 (PST)
Message-ID: <d1b08f940812070248r39f1fd0brc25376bba6d3d668@mail.gmail.com>
Date: Sun, 7 Dec 2008 11:48:10 +0100
From: "Andrea Adami" <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20081207021144.GL16628@smtp.west.cox.net>
MIME-Version: 1.0
References: <20081207021144.GL16628@smtp.west.cox.net>
Subject: Re: Broken kernel recipes
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
X-List-Received-Date: Sun, 07 Dec 2008 10:51:57 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

For fixes pls. see bug 4784

Andrea



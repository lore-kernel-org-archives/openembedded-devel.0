Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ka6sox@gmail.com>) id 1QZ6QD-0003So-8M
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Jun 2011 21:15:37 +0200
Received: by iym10 with SMTP id 10so72909iym.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jun 2011 12:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:date:message-id:subject:from:to
	:content-type; bh=O5u9EJutcYM8JEVj5DRwoPR7ANd/vlgQ8c5UtFTsQTk=;
	b=MlsH42Nbxb4+kxyHKZuJrdF4OmKe6dPxOJ5aguOX6s3sE6aU3OmtoIiDUXVcy7HVhi
	ljyHKajCb2s82z+O9Nhczqm+3I9R+cX9znCeRMdh0JqXj7fKAoEeH+4WC0nkNVclt97r
	u0WXln03Qpdnht/u7HQzCoFRI2oq05voSWziw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=Up1vu3altBVC8xZdMwZURsGyIDI1ieJ8Re7gq1xnJ2yi4O1ALl+yDHEZzxY1Zi5X+B
	hmmv+YIlPhKONqYcIaKXs986DdZj1oT5q1TU1IzRcKJuFxUXtLRM84w6K2Bku6R3gXdi
	VNgoiX0j/TxKdMfFvvXLhNQmkJLH9jTUEoDYQ=
MIME-Version: 1.0
Received: by 10.42.159.68 with SMTP id k4mr6892498icx.117.1308683523102; Tue,
	21 Jun 2011 12:12:03 -0700 (PDT)
Received: by 10.42.218.201 with HTTP; Tue, 21 Jun 2011 12:12:03 -0700 (PDT)
Date: Tue, 21 Jun 2011 12:12:03 -0700
Message-ID: <BANLkTinAMvMDotaPXj3zdY5q+H_6mDpzqw@mail.gmail.com>
From: Tom King <ka6sox@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Melo issues
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
X-List-Received-Date: Tue, 21 Jun 2011 19:15:37 -0000
Content-Type: text/plain; charset=ISO-8859-1

there is a huge traffic spike I'm seeing that is running the apache server
OOM.

So I'm converting to nginx/varnish

Probably tonight .eu time.

will email list about this.

Tom
(for the Infra Team)


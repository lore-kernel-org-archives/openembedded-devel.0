Received: from [74.125.44.153] (helo=yx-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <slapinid@gmail.com>) id 1KQ0ID-0006v2-AZ
	for openembedded-devel@openembedded.org; Mon, 04 Aug 2008 15:40:11 +0200
Received: by yx-out-1718.google.com with SMTP id 4so125529yxp.30
	for <openembedded-devel@openembedded.org>;
	Mon, 04 Aug 2008 06:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:cc:mime-version:content-type:content-transfer-encoding
	:content-disposition;
	bh=dTKI8hAI2wj7HXmJ/bqksbd8LIaiMRWPCAEUeCfOouo=;
	b=eFq4f2q+2C6+Bl6UR8vHTI6M6CsKN0vqJmfVrtx30+i3Dpj4kAL8uLIuoZ4jPTfIXQ
	qEbQpCD5Q1RWmo4q749K5ANt9zYqlfJsv7hJvJb0zG2FJGxZKeVvuAvU0WCFQSiuePFP
	iGqYnAPppWvpHUzeFlBAr4CzT4gH+LHLYPZ4Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:cc:mime-version:content-type
	:content-transfer-encoding:content-disposition;
	b=FJx/OkYxE162TF1rf67jJlfKl56X+0GSs3W6znTZgM9KtBnbQ9AL/8XzH8OXvqqgX/
	ek2xh+LUcprbO3+vXq/lzf7GUx6smhL/QEHGjw9r3LBBPHW2USGcZqdBWNWEpzJYggXu
	oM1QFusDmZnvWe3PYyo9U68OFy76rUiCGN7RE=
Received: by 10.151.149.14 with SMTP id b14mr1322493ybo.24.1217857084774;
	Mon, 04 Aug 2008 06:38:04 -0700 (PDT)
Received: by 10.150.227.15 with HTTP; Mon, 4 Aug 2008 06:38:04 -0700 (PDT)
Message-ID: <48239d390808040638r7a5e6351x4c8346497451adae@mail.gmail.com>
Date: Mon, 4 Aug 2008 17:38:04 +0400
From: "Sergey Lapin" <slapinid@gmail.com>
To: openembedded-devel@openembedded.org
MIME-Version: 1.0
Cc: Dmitry <dbaryshkov@gmail.com>
Subject: ppc64 host
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
X-List-Received-Date: Mon, 04 Aug 2008 13:40:12 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi, all!

Do anybody had any success running OE builds on ppc64 host?
If not, is there any advice regarding that?

All the best,
S.



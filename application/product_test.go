package application_test

import (
	"testing"
	"github.com/stretchr/testify/require"
	"github.com/fernandootoni/go-hexagonal"
)

func TestProduct_Enable(t *testing.T) {
	product := application.Product{}
	product.Name = "BYD King"
	product.Status = application.DISABLED
	product.Price = 160000

	err := product.Enable()
	require.Nil(t, err)
}